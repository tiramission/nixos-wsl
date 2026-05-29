{
  config,
  pkgs,
  ...
}: {
  users.extraGroups.docker.members = [config.wsl.defaultUser];
  virtualisation.docker = {
    enable = true;
    extraPackages = [pkgs.nftables];
  };
  services.dockerRegistry = {
    enable = true;
  };
}
