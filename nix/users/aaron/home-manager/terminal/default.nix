{ config, pkgs, ... }:
{
  config.home.packages = with pkgs; [
    htop
    neovim
    ranger
    ripgrep
  ];

  config.cyber.alacritty = {
    enable = true;
    configPath = ../../dotfiles/alacritty/alacritty.yml;
  };

  config.home.sessionVariables = {
    EDITOR = "${pkgs.neovim}/bin/nvim";
    VISUAL = "${pkgs.neovim}/bin/nvim";
  };

  config.programs = {
    git = {
      enable = true;
      userName = "Aaron Dodd";
      userEmail = "me@aaronrdodd.com";
    };
    zsh.enable = true;
  };
}
