{
  config,
  inputs,
  info,
  lib,
  pkgs,
  ...
}: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  programs.zsh.enable = true;
  users.users.${config.wsl.defaultUser}.shell = pkgs.zsh;

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupCommand = lib.getExe pkgs.trash-cli;
    users.${config.wsl.defaultUser} = ../home/all.nix;
    extraSpecialArgs = {inherit inputs info;};
  };
}
