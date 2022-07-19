{ lib, pkgs, ... }:
{
  users.users.aaron = {
    description = "Chronos";
    shell = pkgs.zsh;
  } // lib.optionalAttrs pkgs.stdenv.isDarwin {
    home = "/Users/chronos";
  } // lib.optionalAttrs pkgs.stdenv.isLinux {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    initialPassword = "";
  };
}