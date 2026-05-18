{pkgs, ...}: {
  programs.go = {
    enable = true;
    env = {
      CGO_ENABLED = "0";
      GOTOOLCHAIN = "local";
    };
  };

  home.packages = [
    pkgs.gopls

    (pkgs.runCommandLocal "multi-go" {} ''
      mkdir -p $out/bin
      ln -s ${pkgs.go_1_26}/bin/go $out/bin/go1.26
      ln -s ${pkgs.go_1_25}/bin/go $out/bin/go1.25
    '')
  ];
}
