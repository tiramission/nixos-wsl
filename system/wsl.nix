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
    wrapBinSh = false; # https://github.com/microsoft/vscode-remote-release/issues/10375
    ssh-agent.enable = true;
    wslConf.interop.appendWindowsPath = false;
  };
  system.stateVersion = config.system.nixos.release;
}
