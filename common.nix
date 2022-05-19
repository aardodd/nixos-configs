{ config, lib, pkgs, ... }:

with lib;

{
  config = {

    # General
    system.stateVersion = "21.11";

    nix.gc.automatic = true;
    nix.gc.options = "--delete-older-than 30d";
    nix.optimize.automatic = true;

    users.mutableUsers = true;

    system.autoUpgrade.enable = true;
    system.autoUpgrade.allowReboot = true;
    system.autoUpgrade.channel = https://nixos.org/channels/nixos-21.11;
    system.autoUpgrade.dates = "06:45";

    # Locale
    i18n.defaultLocale = "en_GB.UTF-8";

    services.timesyncd.enable = true;
    time.timeZone = "Europe/London";

    console.keyMap = "uk";
    services.xserver.layout = "gb";

    # Services
    services.openssh = {
      enable = true;
      passwordAuthentication = false;
      challengeResponseAuthentication = false;
    };

    programs.ssh.startAgent = true;

    services.syncthing = {
      enable = true;
      user = "aaron";
      openDefaultPorts = true;
    };

    virtualisation.docker.enable = true;
    virtualisation.docker.autoPrune.enable = true;
    virtualisation.oci-containers.backend = "docker";

    # Monitoring

    # User accounts
    programs.zsh.enable = true;
    users.extraUsers.aaron = {
      uid = 1000;
      description = "Aaron Dodd <aarondodd@protonmail.com>";
      isNormalUser = true;
      extraGroups = [ "docker" "wheel" ];
      group = "users";
      initialPassword = "deadbread";
      shell = "/run/current-system/sw/bin/zsh";
    };

    # Packages
    programs.gnupg.agent.enable = true;
    nixpkgs.config.allowUnfree = true;
    environment.systemPackages = with pkgs; [
      aspell
      aspellDicts.en
      bind
      docker_compose
      file
      fortune
      fzf
      git
      gnum4
      gnupg
      gnupg1compat
      haskellPackages.hledger
      htop
      imagemagick
      iotop
      lsof
      lynx
      man-pages
      ncdu
      nmap
      proselint
      psmisc
      python3
      ripgrep
      rsync
      rxvt_unicode.terminfo
      smartmontools
      stow
      tmux
      unzip
      vale
      vim
      vnstat
      wget
      which
      whois
      (if config.services.xserver.enable then emacs else emacs-nox)
    ];
  };
}
