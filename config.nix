{
  allowUnfree = true;
  allowBroken = true;
  fonts.fontconfig = {
    enable = true;
  };

  packageOverrides = super: let self = super.pkgs; in
  {
    myHaskellEnv = self.haskellPackages.ghcWithHoogle
                     (haskellPackages: with haskellPackages; [
                       cabal2nix
                       cabal-install
                       ghc
                       hlint
                       ghcid
                       dhall
                       dhall-json
                       dhall-lsp-server
                     ]);
  };
}
