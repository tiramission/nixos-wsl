{pkgs, ...}: {
  home.packages = with pkgs; [
    alejandra
    just
    # neovim
    sops
  ];
}
