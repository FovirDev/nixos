{ ... }: {
  plugins.leetcode = {
    enable = true;

    settings = {
      lang = "java";
      storage.home = "~/Projects/leetcode";
      picker.provider = "telescope";
    };
  };
}
