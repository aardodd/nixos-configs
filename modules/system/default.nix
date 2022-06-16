{ config, lib, pkgs, ... }: {
  imports = [
    ./users.nix
    ./xserver.nix
  ];

  options.universe.machine = {
    name = lib.mkOption {
      type = lib.types.str;
      default = "nixos";
      description: "The machines hostname.";
    };

    role = lib.mkOption {
      type = lib.types.enum [ "desktop" "laptop" "server" ];
      default = "desktop";
      description = "The machines type. Determines whether this machine is a [desktop], [laptop], or [server].";
    };

    flavor = lib.mkOption {
      type = lib.types.enum [ "generic" "nixos" "wsl" ];
      default = "nixos";
      description = "The linux flavor. Determines whether the machine is running as a [generic] linux, [nixos] or [wsl]."
    };

    config = lib.mkMerge [
      {
        documentation.man = {
          enable = true;
          generateCaches = true;
        };

        time.timeZone = "Europe/London";
        nix.extraOptions = "experimental-features = nix-command flakes";
        system.stateVersion = "22.05";
      }

      (lib.mkIf (config.universe.machine.flavor != "wsl") {
        boot.loader.systemd-boot.enable = true;
        boot.loader.efi.canTouchEfiVariables = true;
        boot.kernelPackages = pkgs.linuxPackages_latest;
        networking.networkmanager.enable = true;
        networking.firewall.enable = true;
      });

      (lib.mkIf (config.universe.machine.flavor == "wsl") {
        wsl = {
          enable = true;
          automountPath = "/mnt";
          defaultUser = config.universe.machine.user.name;
          startMenuLaunchers = false; # Done below to include Home Manager apps
        };

        # Copied from https://github.com/nix-community/NixOS-WSL/blob/69783cf56b2ada7e0e8cc8d17907a346e8bd97b7/modules/wsl-distro.nix#L111
        system.activationScripts.copy-home-launchers = lib.stringAfter [ ] ''
          cd "$(mktemp -d)"
          for x in applications icons; do
            echo "Copying /usr/share/$x"
            ${pkgs.rsync}/bin/rsync -ar $systemConfig/sw/share/$x/. ./$x
            ${pkgs.rsync}/bin/rsync -ar /etc/profiles/per-user/${config.myme.machine.user.name}/share/$x/. ./$x
            mkdir -p /usr/share/$x
            ${pkgs.rsync}/bin/rsync -ar --delete ./$x/. /usr/share/$x
          done
        '';
      });

      (lib.mkIf (config.universe.machine.role != "server") {
        programs.dconf.enable = true;
        sound.enable = true;
        hardware.pulseaudio.enable = true;
      });
    ];
  };
};