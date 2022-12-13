{ pkgs, ...}:
let
  ghcVersion = "ghc943";
in {
  # https://haskell4nix.readthedocs.io/nixpkgs-users-guide.html
  # The name pkgs.haskellPackages is really just a synonym for haskell.packages.ghcXYZ so you can be explicit
  # with a ghc version vs use whatever is the default on nix packages at the time.

  # these are general haskell dev tools that can be used from CLI or within IDE.
  haskell-env = with pkgs.haskell.packages.${ghcVersion}; [
    ghc
    hlint
    ghcid
    hoogle
    dhall
    cabal-install
    stack
  ];

  # tell ghc to register these additional libraries
  haskell-ghc = pkgs.haskell.packages.${ghcVersion}.ghcWithHoogle
    (p: [
      p.mtl
      p.lens
      p.hspec
   ]);


  home.file.".ghcid".text = builtins.readFile ./ghcid-config.nix;
  home.file.".ghci".source = ''
    :def! hoogle \s -> return $ ":! hoogle search --colour --count=15 \"" ++ s ++ "\""
    :def! doc \s -> return $ ":! hoogle search --colour --info \"" ++ s ++ "\""
  ''
}
