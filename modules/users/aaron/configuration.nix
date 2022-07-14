{ lib, pkgs, ... }:
{
  users.users.aaron = {
    description = "Aaron Dodd";
    shell = pkgs.zsh;
  } // lib.optionalAttrs pkgs.stdenv.isDarwin {
    home = "/Users/aaron";
  } // lib.optionalAttrs pkgs.stdenv.isLinux {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    initialPassword = "deadbread";
  };
}