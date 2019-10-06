{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    historyLimit = 5000;
    extraConfig = ''
      # rebind key from ctrl b to ctrl a
      unbind C-b
      set-option -g prefix C-a
      bind-key C-a send-prefix

      set-option -g default-shell ${pkgs.zsh}/bin/zsh
      set -g status-keys vi
      set-window-option -g mode-keys vi

      # reload tmux config
      bind r source-file ~/.tmux.conf \; display "Configuration Reloaded!"

      set -g mouse on
      set -g default-terminal "tmux-256color"

      # don't allow tmux to rename the window based on commands running
      set-window-option -g allow-rename off

      # split panes using | and -
      bind | split-window -h
      bind - split-window -v
      unbind '"'
      unbind %

      # enable activity alerts
      setw -g monitor-activity on
      set -g visual-activity on

      # theme
      set -g status-bg colour33
      # set-window-option -g pane-active-border-style bg=colour33
    '';
  };
}
