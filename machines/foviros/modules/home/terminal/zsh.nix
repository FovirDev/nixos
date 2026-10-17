{ pkgs, ... }:
let
  iconPathPrefix = "${pkgs.beauty-line-icon-theme}/share/icons/BeautyLine/apps/scalable";
  successIcon = "${iconPathPrefix}/gnome-info.svg";
  failedIcon = "${iconPathPrefix}/error.svg";
in
{
  programs.zsh = {
    enable = true;

    autocd = true;
    autosuggestion.enable = true;
    defaultKeymap = "viins";
    enableCompletion = true;
    history.size = 10000;
    syntaxHighlighting.enable = true;
    shellAliases = {
      cb = "cargo build";
      cbr = "cargo build --release";
      cbrv = "cargo build --release --verbose";
      cbv = "cargo build --verbose";
      cf = "cargo fix --allow-dirty --allow-staged --tests";
      cp = "cp -v";
      cr = "cargo run";
      crv = "cargo run --verbose";
      ct = "cargo test";
      ctv = "cargo test --verbose";
      f = "fg";
      gc = "git commit --verbose -s";
      gfo = "git fetch origin";
      gfu = "git fetch upstream";
      gpa = "git push --all";
      gpt = "git push --tags";
      gpwt = "git push && git push --tags";
      grau = "git remote add upstream";
      grsp = "git restore -p";
      gs = "git switch";
      gsc = "git switch --create";
      gsd = "git switch $(git_develop_branch)";
      gsm = "git switch $(git_main_branch)";
      gst = "git status --untracked-files";
      gtd = "git tag --delete";
      h = "hermes";
      j = "just";
      la = "eza -a --color=always --group-directories-first --icons=always"; # All files and dirs.
      ll = "eza -l --color=always --group-directories-first --icons=always"; # Long format.
      ls = "eza -alF --color=always --group --group-directories-first --icons=always"; # Preferred listing.
      lt = "eza -aT --color=always --group-directories-first --icons=always"; # Tree listing.
      mv = "mv --verbose";
      n = "nvim";
      o = "xdg-open"; # Open.
      oc = "opencode";
      open = "xdg-open"; # Open.
      rm = "rm -v";
      tmp = "cd $(mktemp -d)";
    };

    initContent = ''
      autoload -U promptinit; promptinit
      PURE_GIT_STASH_SYMBOL='$'

      zstyle :prompt:pure:environment:nix-shell show no
      zstyle :prompt:pure:git:dirty detailed yes
      zstyle :prompt:pure:git:stash show yes

      autoload -Uz add-zsh-hook

      typeset -g PURE_GITHUB_PR=""
      typeset -g PURE_GITHUB_PR_ADDITIONS=""
      typeset -g PURE_GITHUB_PR_DELETIONS=""
      typeset -g PURE_GITHUB_PR_KEY=""

      function pure_github_pr_redraw() {
        psvar[24]="''${PURE_GITHUB_PR}"
        psvar[25]="''${PURE_GITHUB_PR_ADDITIONS}"
        psvar[26]="''${PURE_GITHUB_PR_DELETIONS}"

        if zle >/dev/null 2>&1; then
          zle reset-prompt
        fi
      }

      function pure_github_pr_clear() {
        PURE_GITHUB_PR=""
        PURE_GITHUB_PR_ADDITIONS=""
        PURE_GITHUB_PR_DELETIONS=""

        pure_github_pr_redraw
      }

      function pure_github_pr_fetch() {
        local repo_root="$1"
        local branch="$2"
        local cache_key="$3"

        local head base number additions deletions
        local current_number=""
        local previous_branch=""
        local next_branch=""
        local current_additions=""
        local current_deletions=""

        builtin cd -- "$repo_root" || return 10

        while IFS=$'\t' read -r \
          number head base additions deletions; do

          [[ -n "$head" ]] || continue

          if [[ "$head" == "$branch" ]]; then
            current_number="$number"
            previous_branch="$base"
            current_additions="$additions"
            current_deletions="$deletions"
          fi

          if [[ "$base" == "$branch" ]]; then
            if [[ -z "$next_branch" ]]; then
              next_branch="$head"
            else
              next_branch="''${next_branch}, ''${head}"
            fi
          fi
        done < <(
          GH_PAGER=cat GH_PROMPT_DISABLED=1 \
            command gh pr list \
              --state open \
              --limit 200 \
              --json number,headRefName,baseRefName,additions,deletions \
              --jq '.[] |
                [
                  (.number | tostring),
                  .headRefName,
                  .baseRefName,
                  (.additions | tostring),
                  (.deletions | tostring)
                ] |
                @tsv'
        ) || return 11

        [[ -n "$current_number" ]] || return 12

        print -r -- \
          "''${cache_key}|''${current_number}|''${previous_branch}|''${next_branch}|''${current_additions}|''${current_deletions}"
      }

      function pure_github_pr_callback() {
        local job_name="$1"
        local return_code="$2"
        local output="$3"

        [[ "$job_name" == pure_github_pr_fetch ]] || return

        if (( return_code != 0 )); then
          pure_github_pr_clear
          return
        fi

        local result_key="''${output%%|*}"
        local pr_info="''${output#*|}"

        local pr_number="''${pr_info%%|*}"
        pr_info="''${pr_info#*|}"

        local previous_branch="''${pr_info%%|*}"
        pr_info="''${pr_info#*|}"

        local next_branch="''${pr_info%%|*}"
        pr_info="''${pr_info#*|}"

        local additions="''${pr_info%%|*}"
        local deletions="''${pr_info#*|}"

        additions="''${additions//$'\n'/}"
        deletions="''${deletions//$'\n'/}"

        if [[ "$result_key" != "$PURE_GITHUB_PR_KEY" ]]; then
          return
        fi

        if [[ -z "$pr_number" ]]; then
          pure_github_pr_clear
          return
        fi

        if [[ -n "$previous_branch" ]] &&
           [[ -n "$next_branch" ]]; then
          PURE_GITHUB_PR="''${previous_branch} ← PR #''${pr_number} ← ''${next_branch}"
        elif [[ -n "$previous_branch" ]]; then
          PURE_GITHUB_PR="''${previous_branch} ← PR #''${pr_number}"
        elif [[ -n "$next_branch" ]]; then
          PURE_GITHUB_PR="PR #''${pr_number} ← ''${next_branch}"
        else
          PURE_GITHUB_PR="PR #''${pr_number}"
        fi

        PURE_GITHUB_PR_ADDITIONS="+''${additions}"
        PURE_GITHUB_PR_DELETIONS="-''${deletions}"

        pure_github_pr_redraw
      }

      function update_pure_github_pr_async() {
        local repo_root branch cache_key

        repo_root=$(
          command git rev-parse --show-toplevel 2>/dev/null
        ) || {
          PURE_GITHUB_PR_KEY=""
          pure_github_pr_clear
          return
        }

        branch=$(
          command git symbolic-ref --quiet --short HEAD 2>/dev/null
        ) || {
          PURE_GITHUB_PR_KEY=""
          pure_github_pr_clear
          return
        }

        cache_key="''${repo_root}:''${branch}"

        [[ "$cache_key" == "$PURE_GITHUB_PR_KEY" ]] && return

        PURE_GITHUB_PR_KEY="$cache_key"

        pure_github_pr_clear

        (( $+commands[gh] )) || return

        async_flush_jobs pure_github_pr_worker

        async_job \
          pure_github_pr_worker \
          pure_github_pr_fetch \
          "$repo_root" \
          "$branch" \
          "$cache_key"
      }

      function prompt_pure_precustom() {
        psvar[24]="''${PURE_GITHUB_PR}"
        psvar[25]="''${PURE_GITHUB_PR_ADDITIONS}"
        psvar[26]="''${PURE_GITHUB_PR_DELETIONS}"
      }

      prompt pure

      prompt_newline='%(24V.'
      prompt_newline+=$'\n%{\r%}'
      prompt_newline+='%F{cyan}󱞪 %24v%f %F{green}%25v%f %F{red}%26v%f.)'
      prompt_newline+=$'\n%{\r%}%666v'

      if (( $+functions[async_start_worker] )); then
        async_start_worker pure_github_pr_worker -n

        async_worker_eval \
          pure_github_pr_worker \
          "$(typeset -f pure_github_pr_fetch)"

        async_register_callback \
          pure_github_pr_worker \
          pure_github_pr_callback

        add-zsh-hook precmd update_pure_github_pr_async
      fi

      function pure-pr-refresh() {
        PURE_GITHUB_PR_KEY=""

        pure_github_pr_clear
        update_pure_github_pr_async
      }

      set -o vi
      bindkey -M viins '^H' backward-kill-word

      function zle-keymap-select {
        if [[ ''${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]; then
          echo -ne '\e[1 q'
        elif [[ ''${KEYMAP} == main ]] || [[ ''${KEYMAP} == viins ]] || [[ ''${KEYMAP} = "" ]] || [[ $1 = 'beam' ]]; then
          echo -ne '\e[5 q'
        fi
      }
      zle -N zle-keymap-select

      zle-line-init() {
          zle -K viins
          echo -ne "\e[5 q"
      }
      zle -N zle-line-init

      echo -ne '\e[5 q'

      bgnotify_threshold=10
      function bgnotify_formatted {
        ## $1=exit_status, $2=command, $3=elapsed_time
        local elapsed="$(( $3 % 60 ))s"
        (( $3 < 60 ))   || elapsed="$((( $3 % 3600) / 60 ))m $elapsed"
        (( $3 < 3600 )) || elapsed="$((  $3 / 3600 ))h $elapsed"

        [ $1 -eq 0 ] && icon="${successIcon}" || icon="${failedIcon}"
        bgnotify "took ''${elapsed}" "$2" "$icon"
      }
    '';

    oh-my-zsh = {
      enable = true;

      plugins = [
        "bgnotify"
        "git"
      ];
    };
  };
}
