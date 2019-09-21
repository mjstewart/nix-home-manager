#!/bin/bash

export NIX_PATH=$HOME/.nix-defexpr/channels${NIX_PATH:+:}$NIX_PATH


ln -s $PWD/home.nix ~/.config/nixpkgs
ln -s $PWD/config.nix ~/.config/nixpkgs