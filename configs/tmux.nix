{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    keyMode = "vi";
    historyLimit = 5000;
    extraConfig = ''
      set-option -g default-shell ${pkgs.zsh}/bin/zsh
      set -g mouse on
    '';
  };
}


