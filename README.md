# nix-home-manager

This is my personal configuration for [home manager](https://github.com/rycee/home-manager)

# setup

### 1. install nix

### 2. install home-manager

Run the initial setup which will build all the derivations which may take a while.

```
home-manager switch
```

### 3. install docker

docker daemon cant connect when installing it via home-manager.
https://docs.docker.com/install/linux/docker-ce/ubuntu/

```
sudo usermod -aG docker your-user
```

### 4. setup terminal

Instruct the terminal to start `tmuxinator`.

Create a custom launcher

`right click panel > panel > add items > add a launcher > within the laucher add an xfce terminal`

go into the configuration and then add this startup command

```
xfce4-terminal -e 'tmuxinator start'
```

### 5. intellij

Tell intellij where openjdk is within the nix-store. You can find this out by doing

```
which java
ls -ln ~/.nix-profile/bin | grep java

# get the path from above, you'll notice its in the lib directory
cd /nix/store/rj4ryx8xbwy1mmlv6l21ciqzak1v9dig-home-manager-path/lib
```

# other useful tips

use `tmux list-windows` to find the custom layout syntax after building the layout you want within tmux.

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


# general nix tips

everything is a derivation (recipe on how to build something). If an application isnt on nixpkgs, you can
create it yourself like I did with `daml`.

The general tip is that there are build phases, you can override them to suit your goals.
https://nixos.org/nixpkgs/manual/#ssec-controlling-phases

The interesting thing is, in the `fixup` phase, it will call this bash function `patchShebangs` which will
make sure all bash scripts in a directory or file have their shebang bash `bash` referring to the nix store version.
```
patchShebangs fileA dirA dirB ...
```

There is also another function where you call specifiy the single file to replace something in.

```
substituteInPlace ./install.sh \
  --replace '/usr/bin/env bash' ${bash}/bin/bash
```

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




# nix basics

derivation `.drv` is a receipe describing what you want to build. Its really just an attribute set
with a few special key=value pairs.

you then 'realise' the derivation but executes the side effect of running the recipe to build something.

the cool thing with nix is, each derivations default toString is to print out derivation path.

```
builtins.toString coreutils
"${coreutils}"
```

nix gives you a $out path which is pre calculated based on the inputs of the derivation. this is where your
builder scripts will place the build artifacts. Think of $out as this nice safe place nix creates for you waiting
for you to put your build artifact files.
It's like Nix reserved a slot in the nix store for us, and we must fill it.

if you make your own derivation, you must make sure to create an
$out directory otherwise derivation will fail to be created.

this means you can refer to other derivations by using "${pkgs.name}/bin" because the $out paths are already
known since they are all determined by a hash of the derivation inputs.


the .drv file is the representation of the build action to perform in order to build the out path.
it has buildInputs which needs to be built before this .drv can be built.

every attribute in the derivation attribute set, is available an as environment variable in the builder script.



### dont use nix-env

installing libraries with nix-env is not good practice. We prefer to have isolated environments for development.
`nix-shell` is great for spinning up a isolated sandbox with all the dependencies you need without polluting
your main system. use `nixos` or `home-manager` to manage system packages.



### nix-collect-garbage

during playing around, you'll likely create lots of generations so its good to do some clean up.


The thing with garbage collecting is that previous generations can still hold a reference to the deleted
package making it ineligble for garbage collection.

```
# install a package to try out
nix-env -iA nixpkgs.bsdgames

nix-store -q --roots `which fortune`
# => look at the path to the store (it should be gone after nix-collect-garbage)

# The nix-store command can be used to query the GC roots that refer to a given derivation. In this case, our current user environment does refer to bsd-games.
nix-store -q --roots `which fortune`

nix-env --list-generations


# now try remove it

nix-env -e bsd-games
nix-collect-garbage

ls -l ${the original nix-store location of bsdgames}
```


It wasnt removed because older profiles refer to this package. so we need to clean up and remove old profiles

```
# the -d option of nix-collect-garbage is used to delete old generations of all profiles, then collect garbage.
nix-collect-garbage -d

# I think something like this also does a similar thing
ls -l /nix/var/nix/profiles/per-user/matt

nix-env --delete-generations old

home-manager generations
home-manager (follow the prompts)

```

## use callPackage

```
given you have a .nix file (demo.nix) with a function

{ a, b, c, d }:

stdenv.mkDerivation {
  ...
}

its annoying to have to pass this in manually at the callsite

let
  demo = import ./demo.nix with pkgs; { inherit a b c d };


  # NEW
  p = import <nixpkgs> {};
  demo = p.callPackage demo { d = overrideThisPackageOnly; }

  because input args and package names are often the same, this essentially just finds which args
  you need for nixpkgs and calls the function for you automatically!
```



# create haskell project using cabal

nix and cabal is all you need, no need for stack anymore

```
nix-shell --pure -p ghc cabal-install --run "cabal init"
nix-shell --pure -p cabal2nix --run "cabal2nix ." > default.nix
nix-shell --pure -p ghc ghcid which
```
