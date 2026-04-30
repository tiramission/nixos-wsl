{pkgs, ...}: {
  nix = {
    package = pkgs.lixPackageSets.stable.lix;
    settings = {
      experimental-features = ["nix-command" "flakes"];
      substituters = [
        "https://mirrors.ustc.edu.cn/nix-channels/store"
        "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
        "https://cache.garnix.io"
      ];
      trusted-public-keys = [
        "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
      ];

      use-xdg-base-directories = true;
      accept-flake-config = true;
    };
    channel.enable = false;
    optimise.automatic = true;
  };
  nixpkgs.config.allowUnfree = true;

  programs.nix-ld.enable = true;
  time.timeZone = "Asia/Shanghai";
}
