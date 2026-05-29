{
  imports = [
    ./wsl.nix
    ./nix.nix
    ./home.nix
    ./sops.nix

    ./components/incus.nix
    ./components/docker.nix
    ./components/binfmt.nix
  ];
}
