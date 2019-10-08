{ fetchFromGitHub }:

{
  programs.zsh = {
    enable = true;
    defaultKeymap = "viins";
    enableAutosuggestions = true;
    enableCompletion = true;

    # turn off this - WARNING: terminal is not fully functional
    initExtra = ''
      export TERM=xterm
    '';

    shellAliases = {
      mci = "mvn clean install -DskipTests";
      mcit = "mvn clean install";
      mcp = "mvn clean package -DskipTests";
      mcpt = "mvn clean package";
      myghcid = "ghcid \
        --command cabal repl \
          --ghc-options=-Wall \
          --ghc-options=-fno-code \
          --ghc-options=-fno-break-on-exception \
          --ghc-options=-fno-break-on-error \
          --ghc-options=-ferror-spans \
        --clear \
        --no-height-limit \
        --reverse-errors";
    };

    # .zshrc will get updated to source this plugin automatically
    plugins = [
      {
        # nix-prefetch-url --unpack https://github.com/zsh-users/zsh-syntax-highlighting/archive/0.6.0.tar.gz
        name = "zsh-syntax-highlighting";
        src = fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-syntax-highlighting";
          rev = "0.6.0";
          sha256 = "0zmq66dzasmr5pwribyh4kbkk23jxbpdw4rjxx0i7dx8jjp2lzl4";
        };
      }
    ];

    # out of the box plugins - https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [
        "git"
        "vi-mode"
      ];
    };
  };
}
