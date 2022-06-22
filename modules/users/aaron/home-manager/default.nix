{ pkgs, ... }:

let
  inherit (pkgs) neovim ripgrep;
in
{
  home.packages = [
    neovim
    ripgrep
  ];

  home.sessionVariables = {
    EDITOR = "${neovim}/bin/nvim";
    VISUAL = "${neovim}/bin/nvim";
  };

  programs.fish.enable = true;
}