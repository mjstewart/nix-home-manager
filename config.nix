{
  allowUnfree = true;
  allowBroken = true;

  virtualisation.docker.enable = true;

  chromium = {
    enablePepperFlash = true;
  };

  ghc.version = "ghc882";
}
