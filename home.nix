{ pkgs, ... }:

let
  config = import ./config.nix;
  vscodeConfig = pkgs.callPackage ./apps/vscode-config.nix {};
  ghcidConfig = pkgs.callPackage ./apps/ghcid-config.nix {};

  daml = pkgs.callPackage ./apps/daml {};

  # these are general haskell dev tools that can be used from CLI or within IDE.
  haskell-env = with pkgs.haskell.packages.${config.ghc.version}; [
    hlint
    ghcid
    hoogle
    dhall
    ormolu
    cabal-install
  ];

  # tell ghc to register these additional libraries
  haskell-ghc = pkgs.haskell.packages.${config.ghc.version}.ghcWithPackages
    (p: [
      p.mtl
      p.lens
      p.hspec
   ]);

in
{
  nixpkgs.overlays = [
    (import ./overlays.nix)
  ];

  programs.git = (pkgs.callPackage ./apps/git.nix {}).programs.git;
  programs.tmux = (pkgs.callPackage ./apps/tmux {}).programs.tmux;
  programs.vim = (pkgs.callPackage ./apps/vim.nix {}).programs.vim;
  programs.zsh = (pkgs.callPackage ./apps/zsh.nix { inherit ghcidConfig; }).programs.zsh;

  home.packages = with pkgs; [
    # java
    jdk13
    maven

    # utils
    xclip
    htop
    jq
    wget
    zip
    unzip
    tree
    keepassxc

    # dev
    tmux
    tmuxinator
    meld
    docker-compose
    insomnia
    my-vscode # uses overlays.nix
    jetbrains.idea-ultimate
    graphviz
    nodejs-12_x

    # haskell
    haskell-ghc
    daml

    # the usual stuff
    google-chrome
    slack

  ] ++ haskell-env;

  news.display = "silent";

  home.file.".config/Code/User/settings.json".text = builtins.toJSON vscodeConfig.settings;
  home.file.".config/Code/User/keybindings.json".text = builtins.toJSON vscodeConfig.keybindings;
  home.file.".config/Code/User/snippets/my.code-snippets".text = builtins.toJSON vscodeConfig.snippets;
  home.file.".ghcid".text = ghcidConfig.dotGhcidFile;
  home.file.".ghci".source = ./apps/ghci;

  home.file.".tmuxinator.yml".source = ./apps/tmux/tmuxinator.yml;
  home.file.".IntelliJIdea2019.2/config/templates/output.xml".source = ./apps/intellij/templates.xml;
}
