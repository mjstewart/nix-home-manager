{ config, pkgs, ... }:

{
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
    wget
    zip
    unzip
    tmux
    tree
    meld
    google-chrome
    # docker
    docker-compose
    insomnia
    slack
    fira-code
    fira-code-symbols
    fontconfig
    myHaskellEnv
    myHies
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager = {
    enable = true;
    path = https://github.com/rycee/home-manager/archive/release-19.03.tar.gz;
  };

  news.display = "silent";
  # home.stateVersion = "19.09";
}
