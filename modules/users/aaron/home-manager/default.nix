{ pkgs, ... }:
{
  imports = [
    ./terminal.nix  
  ]

  home.packages = with pkgs; [
    firefox
  ];

  home.sessionVariables = {
    EDITOR = "${neovim}/bin/nvim";
    VISUAL = "${neovim}/bin/nvim";
  };

  programs = {

  };

  programs.zsh.enable = true;
}