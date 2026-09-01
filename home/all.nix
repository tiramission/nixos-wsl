{osConfig, ...}: {
  imports = [
    ./modules.d/sops2env.nix

    ./packages.nix
    ./programs.nix
    ./services.nix
  ];

  home.stateVersion = osConfig.system.nixos.release;
  home.sessionPath = ["$HOME/.local/bin" "$HOME/.cache/.bun/bin"];
  xdg.enable = true;
}
