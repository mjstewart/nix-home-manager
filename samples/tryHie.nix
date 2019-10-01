{ pkgs ? import <nixpkgs> {}, ... }:

let
  all-hies = import (fetchTarball "https://github.com/infinisil/all-hies/tarball/master") {};

   # assumes cache is installed
  hie = all-hies.selection { selector = p: { inherit (p) ghc865; }; };

   # create this bash script in the nix store
   hieWrapper = pkgs.writeShellScriptBin "hie" ''
    "${hie}/bin/hie"
   '';
in
hieWrapper 