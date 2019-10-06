{ pkgs, ... }:

{
  programs.vim = {
    enable = true;

    extraConfig = ''
      set clipboard=unnamed
      set relativenumber
    '';
  };
}
