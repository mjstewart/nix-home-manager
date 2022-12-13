{ }:

{
  programs.vim = {
    enable = true;

    extraConfig = ''
      set clipboard=unnamedplus

      set wrap                " wrap lines
      set encoding=utf-8      " set encoding to UTF-8 (default was "latin1")
      set wildmenu            " visual autocomplete for command menu
      set showmatch           " highlight matching parentheses / brackets [{()}]
      set laststatus=2        " always show statusline (even with only single window)
      set ruler               " show line and column number of the cursor on right side of statusline
      set visualbell          " blink cursor on error, instead of beeping

      set relativenumber
      set autoindent          " copy indent from current line when starting a new line
      set smartindent         " even better autoindent (e.g. add indent after '{')
    '';
  };
}
