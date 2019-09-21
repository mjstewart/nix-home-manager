{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager = {
    enable = true;
    path = https://github.com/rycee/home-manager/archive/release-19.03.tar.gz;
  };

  imports = [
    ./configs/git.nix
    ./configs/tmux.nix
    ./configs/vim.nix
    ./configs/zsh.nix
    ./configs/vscode.nix
  ];

  home.packages = with pkgs; [
    openjdk12
    maven 
    xclip
    htop
    jq 
    zip
    unzip 
    tmux
    tree
    meld
    google-chrome 
    docker 
    docker-compose
    insomnia 
    slack
    vscode-with-extensions
    dhall
    dhall-json
    fira-code
  ];
}
