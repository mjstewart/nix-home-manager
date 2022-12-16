# lib is the standard lib, contains all the useful functions. normally you'd do with lib;
{ pkgs, lib, config, ... }:

let
  vscodeConfig = pkgs.callPackage ./apps/vscode/config.nix { };
  ghcidConfig = pkgs.callPackage ./apps/haskell/ghcid-config.nix { };
in
{
  programs.home-manager.enable = true;

  # nixpkgs.overlays = [
  #   (import ./overlays.nix)
  # ];

  programs.lazygit.enable = true;
  programs.zoxide.enable = true;
  programs.fzf.enable = true;
  programs.bat.enable = true;
  programs.git = (pkgs.callPackage ./apps/git.nix { }).programs.git;
  programs.zsh = (pkgs.callPackage ./apps/zsh.nix { inherit ghcidConfig; }).programs.zsh;

  programs.vscode = {
    enable = true;
    keybindings = (import ./apps/vscode/keybindings.nix);
    userSettings = vscodeConfig.settings;
    userTasks = {
      version = "2.0.0";
      tasks = [
        {
          type = "shell";
          label = "Hello task";
          command = "echo hello";
        }
      ];
    };
    extensions = with pkgs.vscode-extensions; [
      bbenoist.nix
      vscodevim.vim
      haskell.haskell
    ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      # to get the hashes, rerun home manager and get expected hash
      {
        name = "stylish-haskell";
        version = "0.0.10";
        publisher = "vigoo";
        sha256 = "sha256-GGRhaHhpeMgfC517C3kDUZwzdHbY8L/YePPVf6xie/4=";
      }
      {
        name = "nix-ide";
        version = "0.2.1";
        publisher = "jnoortheen";
        sha256 = "sha256-yC4ybThMFA2ncGhp8BYD7IrwYiDU3226hewsRvJYKy4=";
      }
      {
        name = "haskell-ghcid";
        version = "0.3.1";
        publisher = "ndmitchell";
        sha256 = "1rivzlk32x7vq84ri426nhd6a4nv3h7zp7xcsq31d0kp8bqczvi9";
      }
      {
        name = "better-align";
        version = "1.1.6";
        publisher = "wwm";
        sha256 = "1ldvpava9xlqy3zwwc0c04pk9dh09jwcwz5lk3b2cr1z8bxn54lh";
      }
    ];
  };


  programs.neovim = {
    enable = true;
    vimAlias = true;
    #extraConfig = builtins.readFile ./home/extraConfig.vim;
    plugins = with pkgs.vimPlugins; [
      auto-pairs
      fzf-vim
      vim-nix
    ];
  };

  programs.kitty = {
    # disabled due to some issue with needing opengl version 3.3
    enable = false;
    settings = {
      font_size = 14;
      font_family = "JetBrainsMono";
      copy_on_select = "yes";
      cursor_shape = "block";
      cursor_blink_interval = 0;
      enable_audio_bell = "no";
      shell = "zsh";
      editor = "nvim";
      window_padding_width = 5;
      tab_title_template = "{index}";
      tab_bar_style = "powerline";
      tab_powerline_style = "angled";
      enabled_layouts = "vertical";
    };
    keybindings = {
      "ctrl+left" = "neighboring_window left";
      "ctrl+up" = "neighboring_window top";
      "ctrl+right" = "neighboring_window right";
      "ctrl+down" = "neighboring_window down";

      "shift+left" = "resize_window narrower";
      "shift+right" = "resize_window wider";
      "shift+up" = "resize_window taller 3";
      "shift+down" = "resize_window shorter 3";
    };
    # theme = "Jet Brains Dracula";
  };
  # dont think I would need these if it worked in home manager.
  # had to manually install kitty then specifiy config files here.
  # see kitty docs for install instructions.
  home.file.".config/kitty/kitty.conf".text = builtins.readFile ./apps/kitty/kitty.conf;
  home.file.".config/kitty/startup.conf".text = builtins.readFile ./apps/kitty/startup.conf;
  home.file.".config/kitty/theme.conf".text = builtins.readFile ./apps/kitty/theme.conf;

  home.file.".ghci".text = ''
    :set prompt "λ> "
    :set -XOverloadedStrings
    :def! hoogle \s -> return $ ":! hoogle search --colour --count=15 \"" ++ s ++ "\""
    :def! doc \s -> return $ ":! hoogle search --colour --info \"" ++ s ++ "\""
  '';

  home.packages = with pkgs; [
    xclip
    tree
    jq
    nixpkgs-fmt
    git
    maven
    jdk18
    docker-compose
    insomnia
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    jetbrains.idea-community
    python3
    #myHaskellEnv
    # haskellPackages.haskell-language-server
    # haskellPackages.hoogle
    # cabal2nix
    # nix-prefetch-git
    # cabal-install
    # haskell
    # haskell-ghc
  ]; # ++ haskell-env;


  #home.file.".IntelliJIdea2019.2/config/templates/output.xml".source = ./apps/intellij/templates.xml;

  home.sessionVariables = {
    EDITOR = "nvim";
    BROWSER = "google-chrome";
    TERMINAL = "kitty";
  };

  home.stateVersion = "22.05";
  home.username = "matt";
  home.homeDirectory = /home/matt;
}
