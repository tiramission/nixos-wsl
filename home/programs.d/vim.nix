{
  inputs,
  pkgs,
  ...
}: {
  home.packages = [
    inputs.mynixvim.packages."${pkgs.stdenv.hostPlatform.system}".default
  ];
  programs.neovim = {
    enable = false;
    defaultEditor = true;
  };
}
