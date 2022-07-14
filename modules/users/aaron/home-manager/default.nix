{ pkgs, ... }:
{
  imports = [
    ./herbstluftwm.nix
    ./polybar.nix
    ./terminal.nix 
  ];

  home.packages = with pkgs; [
    firefox
  ];
}