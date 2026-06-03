{self, ...}: {
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    settings = {
      "*" = {
        StrictHostKeyChecking = false;
        LogLevel = "ERROR";
        UserKnownHostsFile = "/dev/null";
        HashKnownHosts = false;
      };
    };
  };
}
