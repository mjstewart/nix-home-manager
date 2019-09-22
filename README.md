# nix-home-manager

This is my personal configuration for [home manager](https://github.com/rycee/home-manager)

# Tips

## query availale packages

`nix-env -f "<nixpkgs>" -qaP -A haskellPackages`

## vs code extensions

`code --list-extensions -show-versions`

## calculate sha256

Include `--unpack` if its a tarball

`nix-prefetch-url --unpack https://github.com/bitcoinunlimited/bitcoinunlimited/archive/9fcdbf50585744696c74c162398cea4f026efda4.tar.gz`

`nix-prefetch-url https://panaeon.gallery.vsassets.io/_apis/public/gallery/publisher/panaeon/extension/dhall-lang/0.0.4/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage`
