{ pkgs ? import <nixpkgs> {}, config ? import ../config.nix }:

pkgs.runCommand "hellomatt" {
    nativeBuildInputs = [ pkgs.makeWrapper ];
} ''
 echo "MAKING COMMAND"
 mkdir -p $out/bin
 echo "--prefix is "
 

 echo "CONFIG IS"
 echo "${builtins.toJSON config}"
 ''