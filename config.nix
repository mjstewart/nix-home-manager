{
  allowUnfree = true;
  allowBroken = true;

  virtualisation.docker.enable = true;

  chromium = {
    enablePepperFlash = true;
  };

  ghc.version = "ghc865";
  daml.version = "0.13.29";
}
