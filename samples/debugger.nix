{ stdenv, config, ... }:

let
 a = 5;
in stdenv.mkDerivation {
 name = "debug";
 src = ./.;
 installPhase = ''
  echo "config arg contains..."
  echo ${builtins.toJSON config}
 '';
}
