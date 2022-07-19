{ pkgs, ... }:
{
  home.packages = with pkgs; [
    htop
    neovim
    ranger
    ripgrep
  ];

  cyber.alacritty = {
    enable = true;
    configPath = ../../dotfiles/alacritty/alacritty.yml;
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
