{ pkgs, config, lib, ... }:

let
   # create this bash script in the nix store
   ghcidWrapper = pkgs.writeShellScriptBin "ghcid" ''
    argv=( "$@" )
    "${ghcid}/bin/ghcid ''${argv[*]}"
   '';
in 


# makeWrapper executable wrapperfile args
# nativeBuildInputs makes pkgs available at build time only and is required to expose the wrapProgram 
# helper shell function.
# make bin path will just get resolved nix store path to hiewrapper then append with /bin
pkgs.runCommand "${pkgs.my-vscode.name}" {
    nativeBuildInputs = [ pkgs.makeWrapper pkgs.my-vscode ];
} ''
 echo "MAKING COMMAND ${pkgs.myVsCode.name}"
 mkdir -p $out/bin
 echo "--prefix is "
 echo PATH : ${lib.makeBinPath [ hieWrapper ]}


 echo "makeWrapper args"
 echo "${pkgs.myVsCode}/bin/code"
 echo "$out/bin/code"

 echo "CONFIG IS"
 echo "${builtins.toJSON config}"

 makeWrapper \
  ${pkgs.myVsCode}/bin/code \
  $out/bin/code \
  --prefix PATH : ${lib.makeBinPath [ pkgs.cabal-install hieWrapper ]}
'' 

 