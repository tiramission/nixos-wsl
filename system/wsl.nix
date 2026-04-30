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
  wsl.useWindowsDriver = true;
  wsl.wslConf.interop.appendWindowsPath = false;

  system.stateVersion = config.system.nixos.release;
}
