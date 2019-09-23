# nix-home-manager

This is my personal configuration for [home manager](https://github.com/rycee/home-manager)

# TODO

manually install docker, otherwise you get cant connect to socket issue.


# Tips

### query available packages

`nix-env -f "<nixpkgs>" -qaP -A haskellPackages`

or use `nix repl`

```
nix repl
:l <nixpkgs>
haskellPackages.<tab>
haskell.packages.<tab>
```

### vs code extensions

`code --list-extensions --show-versions`

### calculate sha256

Include `--unpack` if its a tarball

`nix-prefetch-url --unpack https://github.com/bitcoinunlimited/bitcoinunlimited/archive/9fcdbf50585744696c74c162398cea4f026efda4.tar.gz`

`nix-prefetch-url https://panaeon.gallery.vsassets.io/_apis/public/gallery/publisher/panaeon/extension/dhall-lang/0.0.4/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage`


### haskell setup

`config.nix` contains the haskell package overrides as per nix docs https://nixos.org/nixpkgs/manual/#users-guide-to-the-haskell-infrastructure

It may be confusing what packages already come preinstalled with the `haskell.packages`. Its easier to just
create a `nix-shell` and see if the command already exists!

```
nix-shell '<nixpkgs>' -A myHaskellEnv
```


### haskell vs code

Note the section on configuring the cache

https://github.com/Infinisil/all-hies
