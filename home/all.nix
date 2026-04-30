{osConfig, ...}: {
  imports = [
    ./pkg.nix
    ./programs.nix
    ./services.nix
    ./zsh.nix
    ./sops.nix
  ];

  home.stateVersion = osConfig.system.nixos.release;
}
