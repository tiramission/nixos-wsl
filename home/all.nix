{osConfig, ...}: {
  imports = [
    ./packages.nix
    ./programs.nix
    ./services.nix
  ];

  home.stateVersion = osConfig.system.nixos.release;
  xdg.enable = true;
}
