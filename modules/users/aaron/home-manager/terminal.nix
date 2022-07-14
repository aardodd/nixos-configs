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
    kitty = {
      enable = true;
      theme = "Tokyo Night";

      font = {
        name = "Monaco";
        size = 14;
      };
    };
    zsh.enable = true;
  };
}