{pkgs, ...}: {
  programs.go = {
    enable = true;
    env.CGO_ENABLED = "0";
  };

  home.packages = [pkgs.gopls];
}
