{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    htop
    neovim
    ranger
    ripgrep
  ];

  config.cyber.alacritty = {
    enable = true;
  };

  home.sessionVariables = {
    EDITOR = "${pkgs.neovim}/bin/nvim";
    VISUAL = "${pkgs.neovim}/bin/nvim";
  };

  programs = {
    git = {
      enable = true;
      userName = "Aaron Dodd";
      userEmail = "me@aaronrdodd.com";
    };
    zsh.enable = true;
  };
}
