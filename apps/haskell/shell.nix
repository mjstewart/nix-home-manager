{ nixpkgs ? import <nixpkgs> { }, compiler ? "ghc942" }:
let
  inherit (nixpkgs) pkgs;

  ghc = pkgs.haskell.packages.${compiler}.ghcWithHoogle (ps: with ps; [
    lens
    mtl
  ]);
in
pkgs.stdenv.mkDerivation {
  name = "my-haskell-env-0";
  buildInputs = [ ghc ];
  #shellHook = "eval $(egrep ^export ${ghc}/bin/ghc)";
}
