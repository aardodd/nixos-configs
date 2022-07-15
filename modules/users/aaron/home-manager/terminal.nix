{ pkgs, ... }:
{
  home.packages = with pkgs; [
    htop
    neovim
    ranger
    ripgrep
  ];

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
    urxvt = {
      enable = true;
    };
    zsh.enable = true;
  };
}