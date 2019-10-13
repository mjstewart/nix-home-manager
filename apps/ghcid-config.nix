{ lib }:

let
  flags = [
    "-Wall"
    "-Wincomplete-record-updates"
    "-Wincomplete-uni-patterns"
    "-Wredundant-constraints"
    "-ferror-spans"
  ];

  ghcOptions = lib.concatMapStringsSep " " (flag: "--ghc-options=" + flag) flags;

  opts = [ "--clear" "--no-height-limit" "--reverse-errors" ];
in {
  # cli = "ghcid --command \"cabal new-repl ${ghcOptions}\" ${lib.concatStringsSep " " opts}";
  cli = "ghcid --command \"cabal new-repl\" ${lib.concatStringsSep " " opts}";

  dotGhcidFile =
    let
      # args = ["--command \"cabal new-repl ${ghcOptions}\""] ++ opts;
      args = ["--command \"cabal new-repl\""] ++ opts;
    in
      lib.concatStringsSep "\n" args;
}
