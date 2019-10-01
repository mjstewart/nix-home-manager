# nix-home-manager

This is my personal configuration for [home manager](https://github.com/rycee/home-manager)

# TODO
manually install docker


# nix-shell

`nix-shell` is perhaps one of the most valuable tools in the Nix toolset. In a sentence, it allows users to enter a sub-shell with specific Nix packages set-up in a sort-of virtual environment.

haskell packaging is a little weird - https://nixos.org/nixpkgs/manual/#how-to-create-a-development-environment

Instead of the default package set haskellPackages, you can also use the more precise name haskell.compiler.ghc7102, which has the advantage that it refers to the same GHC version regardless of what Nixpkgs considers “default” at any given time. The below statements are the same.

```
nix-shell --pure -p haskellPackages.ghc haskellPackages.cabal-install
nix-shell --pure -p haskell.compiler.ghc865 haskell.packages.ghc865.cabal-install
```

you can create `shell.nix` and using `mkShell` derivation to bootstrap a shell without having to do it via
cli. 

# haskell

https://maybevoid.com/posts/2019-01-27-getting-started-haskell-nix.html
https://haskell-at-work.com/episodes/2018-05-13-introduction-to-cabal.html

nix is used to manage dependencies rather than have stack do it


### bootstrap a simple project, use cabal init. 

`--pure` - The `--pure` flag makes sure that you can only access the packages you have defined, so that you do not accidentally use global packages that you have installed on your system.

`--run` lets you execute the command automatically without needing to manually enter the shell.

```
cd ~/haskell/sample
nix-shell --pure -p haskell.compiler.ghc865 haskell.packages.ghc865.cabal-install --run "cabal init"
```

### how to read the syntax

https://github.com/NixOS/nixpkgs/blob/master/doc/languages-frameworks/haskell.section.md#how-to-install-a-compiler-with-libraries

`haskell.packages.ghc865.ghcWithPackages` represents additional packages/libraries to register
with ghc so you can import them into cabal build file.
You will see there are often 2 variants of packages in the nix store, 1 within `haskellPackages.*`,
and the other in the global package space.

This statement is saying that I want `mtl`, `pandoc` available in ghc that I can `import` or declare 
as a dependency in the cabal file. To prove this

**Note**: You might be curious as to the similarity to these

`haskell.packages.ghc865.cabal-install` - use cabal-install which has been build with ghc865
`haskell.compiler.ghc865` - the actual compiler, no packages

```
nix-shell --pure  -p "haskell.packages.ghc865.ghcWithPackages (haskellPackages: with haskellPackages; [ mtl pandoc ])" cabal-install ghcid hlint brittany

ghc-pkg list mtl
ghc-pkg list pandoc
```

The the rest `cabal-install ghcid hlint brittany` are just available
globally in the nix shell as they are tools used for development etc, not actual libraries.
Its useful to have these globally, since vscode depends some of these to work with plugins as it
assumes they are available on the $PATH.

```
nix-shell --pure  -p "haskell.packages.ghc865.ghcWithPackages (haskellPackages: with haskellPackages; [ mtl pandoc ])" cabal-install ghcid hlint brittany
```




You can use the `cabal new-*` commands to to anything else

### Keep it simple, use ghcid

https://www.parsonsmatt.org/2018/05/19/ghcid_for_the_win.html

```
nix-shell --pure  -p "haskell.packages.ghc865.ghcWithPackages (p: with pkgs; [ghcid cabal-install which])""
```



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


nix-shell --pure -p ghc cabal-install --run "cabal init"
nix-shell --pure -p cabal2nix --run "cabal2nix ." > default.nix
nix-shell --pure -p ghc ghcid which



nix-shell --pure -p ghc cabal-install --run "cabal install && cabal update"


 makeWrapper \
  ${pkgs.myVsCode}/bin/code \
  $out/bin/code \
  --prefix PATH : ${lib.makeBinPath [ hieWrapper ]}


# makeWrapper executable wrapperfile args
pkgs.runCommand "${pkgs.myVsCode.name}" {
    nativeBuildInputs = [ pkgs.makeWrapper ];
} ''
 echo "MAKING COMMAND ${pkgs.myVsCode.name}"
 mkdir -p $out/bin
 echo "--prefix is "
 echo PATH : ${lib.makeBinPath [ hieWrapper ]}

 echo "makeWrapper args"
 echo "${pkgs.myVsCode}/bin/code"
 echo "$out/bin/code"

 wrapProgram $out/bin/code --prefix PATH : ${lib.makeBinPath [ hieWrapper ]}
'' 


 wrapProgram ${pkgs.myVsCode}/bin/code --prefix PATH : ${lib.makeBinPath [ hie ]}


 my-haskell-env = self.haskell.packages.ghc865.ghcWithHoogle
      (haskellPackages: with haskellPackages; [
        hlint
        brittany
        mtl
        dhall
        ghcid
        # hoogle
        # dhall-json
        # dhall-lsp-server
    ]);