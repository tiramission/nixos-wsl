{
  config,
  inputs,
  pkgs,
  ...
}: {
  imports = [inputs.nixos-wsl.nixosModules.default];

  wsl = {
    enable = true;
    defaultUser = "nixos";
    useWindowsDriver = true;
    ssh-agent.enable = true;
    wslConf.interop.appendWindowsPath = false;
  };
  system.stateVersion = config.system.nixos.release;
}
