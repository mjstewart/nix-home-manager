{ pkgs, ... }:

let
  overlays = import ./overlays.nix;
  config = import ./config.nix;
  vscode = import ./configs/vscode.nix pkgs;

  # various haskell dev tools that IDE's might need them on the $PATH
  haskell-env = with pkgs.haskell.packages.${config.ghc.version}; [
    hlint
    brittany
    ghcid
    hoogle
    dhall
  ];

  # tell ghc to register these additional libraries
  haskell-ghc = pkgs.haskell.packages.${config.ghc.version}.ghcWithPackages
    (p: [
      p.mtl
      p.lens
   ]);

in
{
  imports = [
    ./configs/git.nix
    ./configs/tmux.nix
    ./configs/vim.nix
    ./configs/zsh.nix
  ];

  nixpkgs.overlays = [
    overlays
  ];

  home.packages = with pkgs; [
    # java
    openjdk12
    maven

    # linux utils
    xclip
    htop
    jq
    wget
    zip
    unzip
    tree

    # dev
    tmux
    meld
    docker-compose
    insomnia
    # from overlays.nix
    my-vscode

    # haskell
    haskell-ghc

    # the usual stuff
    google-chrome
    slack
  ] ++ haskell-env;


  # Let Home Manager install and manage itself.
  programs.home-manager = {
    enable = true;
    path = https://github.com/rycee/home-manager/archive/release-19.03.tar.gz;
  };

  news.display = "silent";

  home.file.".config/Code/User/settings.json".text = builtins.toJSON vscode.settings;
  home.file.".config/Code/User/snippets/my-snippets.json".text = builtins.toJSON vscode.snippets;
}
