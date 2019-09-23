{

  allowUnfree = true;
  allowBroken = true;
  fonts.fontconfig = {
    enable = true;
  };

  virtualisation.docker.enable = true;

  users.extraUsers.matt = {
    isNormalUser = true;
    uid = 1000;
    extraGroups = [ "docker" ];
  };

  packageOverrides = super: let self = super.pkgs; in
  {
    myHaskellEnv = self.haskell.packages.ghc865.ghcWithHoogle
      (haskellPackages: with haskellPackages; [
        hlint
        ghcid
        mtl
        dhall
        # dhall-json
        # dhall-lsp-server
    ]);
  };
}
