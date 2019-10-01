{ pkgs ? import <nixpkgs> {}, config, ... }:

{
  mine = pkgs.haskell.packages.ghc865.ghcWithHoogle
      (haskellPackages: with haskellPackages; [
        hlint
        brittany
        ghc
        ghcid
        ghci
        mtl
        dhall
        # hoogle
        # dhall-json
        # dhall-lsp-server
    ]);
}