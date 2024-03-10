# Omni Opus

The Everything Masterpiece.

All my nix files managed in one central location.

## Installation

Where TAG is specified is how you select the host you would like the flake to apply too.

```console
nix-env -i git
sudo nixos-rebuild test --flake github:DerpyDinosaur/omniopus#[TAG]
nix-env --uninstall git
```

## WSL Issues

I had an issue with flakes in WSL modules, the following discussion fixed it.

https://github.com/nix-community/NixOS-WSL/discussions/374