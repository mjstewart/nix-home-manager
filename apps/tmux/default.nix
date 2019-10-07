{ zsh }:

# tmuxinator is used for layout management.
# configure terminal to call 'tmuxinator start' which will read ~/.tmuxinator config and pass into tmux.
{
  programs.tmux = {
    enable = true;
    historyLimit = 5000;
    extraConfig = ''
      # rebind key from ctrl b to ctrl a
      unbind C-b
      set-option -g prefix C-a
      bind-key C-a send-prefix

      set-option -g default-shell ${zsh}/bin/zsh

      # reload tmux config
      bind r source-file ~/.tmux.conf \; display "Configuration Reloaded!"

      # clear the panel
      bind -n C-k send-keys -R \; send-keys C-l \; clear-history

      # its annoying having 0 at the other end of the keyboard, so start at 1
      set -g base-index 1
      setw -g pane-base-index 1

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
      set-window-option -g pane-active-border-style "bg=default fg=colour33"
    '';
  };
}
