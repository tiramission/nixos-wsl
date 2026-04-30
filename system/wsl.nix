{
  config,
  inputs,
  pkgs,
  ...
}: {
  imports = [inputs.nixos-wsl.nixosModules.default];

  wsl.enable = true;
  wsl.defaultUser = "nixos";
  wsl.ssh-agent.enable = true;

  system.stateVersion = config.system.nixos.release;
}
