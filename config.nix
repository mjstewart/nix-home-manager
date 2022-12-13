{
  allowUnfree = true;


  # packageOverrides = super:
  #   let self = super.pkgs; in {
  #     myHaskellEnv = self.haskell.packages.ghc942.ghcWithHoogle
  #       (haskellPackages: with haskellPackages; [
  #         cabal-install
  #       ]);
  #   };
}
