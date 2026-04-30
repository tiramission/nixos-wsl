{
  config,
  inputs,
  pkgs,
  ...
}: {
  imports = [inputs.nixos-wsl.nixosModules.default];

  wsl.enable = true;
  wsl.defaultUser = "nixos";

  system.stateVersion = config.system.nixos.release;
}
