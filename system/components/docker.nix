{config, ...}: {
  users.extraGroups.docker.members = [config.wsl.defaultUser];
  virtualisation.docker = {
    enable = true;
  };
  services.dockerRegistry = {
    enable = true;
  };
}
