{ pkgs, ... }:
{
  home.packages = with pkgs; [
    htop
    neovim
    ranger
    ripgrep
  ];

  home.sessionVariables = {
    EDITOR = "${neovim}/bin/nvim";
    VISUAL = "${neovim}/bin/nvim";
  };

  programs = {
    git = {
      package = pkgs.gitAndTools.gitFull;
      enable = true;
      userName = "Aaron Dodd";
      userEmail = "me@aaronrdodd.com";
    };
    kitty = {
      enable = true;
      theme = "Tokyo Night";
    };
    zsh.enable = true;
  };
}