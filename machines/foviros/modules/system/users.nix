{
  config,
  inputs,
  pkgs,
  ...
}:
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {
      inherit (config.networking) hostName;
      inherit inputs;
    };
    users.fovir = {
      home = {
        homeDirectory = "/home/fovir";
        stateVersion = "26.05";
        username = "fovir";
      };
      imports = [
        ../../../../modules/optional/mutable-files.nix
        ../../../../modules/optional/activations.nix
        ../home
      ];
    };
  };

  users.users = {
    fovir = {
      extraGroups = import ../../values/user-fovir-extra-groups.nix;
      hashedPassword = import ../../values/user-fovir-password.nix;
      homeMode = "755";
      ignoreShellProgramCheck = true;
      isNormalUser = true;
      shell = pkgs.zsh;
    };
    root = import ../../values/user-root.nix;
  };
}
