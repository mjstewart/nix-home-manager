{ pkgs, ... }:

let
  p = import <nixpkgs> {};

  config = import ./config.nix;
  vscode = import ./apps/vscode.nix pkgs;
  daml = p.callPackage ./apps/daml {};

  # these are general haskell dev tools that can be used from CLI or within IDE.
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
    ./apps/git.nix
    ./apps/tmux
    ./apps/vim.nix
    ./apps/zsh.nix
  ];

  nixpkgs.overlays = [
    (import ./overlays.nix)
  ];

  home.packages = with pkgs; [
    # java
    openjdk12
    maven

    # utils
    xclip
    htop
    jq
    wget
    zip
    unzip
    tree

    # dev
    tmux
    tmuxinator
    meld
    docker-compose
    insomnia
    my-vscode # uses overlays.nix
    jetbrains.idea-ultimate

    # haskell
    haskell-ghc
    daml

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

  home.file.".tmuxinator.yml".source = ./apps/tmux/tmuxinator.yml;
  home.file.".IntelliJIdea2019.2/config/templates/output.xml".source = ./apps/intellij/templates.xml;
}
