{ pkgs ? import <nixpkgs> {} }:

let
  ghcVersion = "ghc865";

  haskell-ghc = pkgs.haskell.packages.${ghcVersion}.ghcWithPackages
    (p: [
      p.mtl
      p.lens
   ]);

  haskell-env = with pkgs.haskell.packages.${ghcVersion}; [
    hlint
    brittany
    ghcid
    hoogle
    dhall
    cabal-install
  ];

in
  pkgs.mkShell {
    buildInputs = with pkgs; [
      haskell-ghc
      vim
    ] ++ haskell-env;
  }
