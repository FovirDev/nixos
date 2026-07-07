{ ... }: {
  disko.devices = {
    disk = {
      main = {
        type = "disk";

        content = {
          type = "gpt";
          partitions = {
            boot = {
              size = "1M";
              type = "EF02";
              priority = 1;
            };

            ESP = {
              size = "256M";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [ "nofail" ];
              };
            };

            zfs = {
              size = "100%";
              content = {
                type = "zfs";
                pool = "zroot";
              };
            };
          };
        };
      };
    };

    zpool = {
      zroot = {
        type = "zpool";
        datasets = {
          "home" = {
            mountpoint = "/home";
            type = "zfs_fs";
          };

          "root" = {
            mountpoint = "/";
            type = "zfs_fs";

            options = {
              mountpoint = "legacy";
            };
          };

          "nix" = {
            mountpoint = "/nix";
            type = "zfs_fs";

            options = {
              mountpoint = "legacy";
            };
          };
        };
      };
    };
  };
}
