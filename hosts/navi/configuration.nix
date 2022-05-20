{ pkgs, ... }:

{
  # Hostname
  networking.hostName = "navi";

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Memory test
  boot.loader.systemd-boot.memtest86.enable = true;

  # Enable pipewire
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Enable Xorg
  services.xserver = {
    enable = true;
    enableCtrlAltBackspace = true;
    displayManager.autoLogin.enable = true;
    displayManager.autoLogin.user = "aaron";
    windowManager.xmonad.enable = true;
  };

  # Fonts
  fonts = {
    fontDir.enable = true;
    enableGhostscriptFonts = true;
    fontconfig.cache32Bit = true;

    fonts = with pkgs; [
      terminus_font
      source-code-pro
    ];
  };

  services.urxvtd.enable = true;

  # Extra packages
  environment.systemPackages = with pkgs; [
    discord
    feh
    firefox
    keepassxc
    mpd
    mpv
    neofetch
    ranger
    rxvt_unicode
    scrot
  ];
}
