let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-23.11";
  pkgs = import nixpkgs { config = {}; overlays = []; };
in
pkgs.mkShellNoCC {
  packages = with pkgs; [
    python3
    poetry
  ];

  shellHook = ''
    cd /mnt/d/Coding/python/cyberdeck
    poetry env remove --all
    poetry env use python
    source /home/nixos/.cache/pypoetry/virtualenvs/cyberdeck-*/bin/activate
    poetry install
  '';
}