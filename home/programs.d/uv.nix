{pkgs, ...}: {
  home.packages = [
    (pkgs.runCommandLocal "multi-python" {} ''
      mkdir -p $out/bin
      ln -s ${pkgs.python313}/bin/python3.13 $out/bin/
      ln -s ${pkgs.python314}/bin/python3.14 $out/bin/
      ln -s ${pkgs.python315}/bin/python3.15 $out/bin/
      ln -s ${pkgs.python315FreeThreading}/bin/python3.15t $out/bin/
      ln -s ${pkgs.python314FreeThreading}/bin/python3.14t $out/bin/
      ln -s ${pkgs.python313FreeThreading}/bin/python3.13t $out/bin/
    '')
  ];
  programs.uv = {
    enable = true;
    settings = {
      python-downloads = "never";
      python-preference = "only-system";
    };
  };
}
