{pkgs, ...}: {
  home.packages = with pkgs; [
    alejandra
    just
    # neovim
    sops
    ssh-to-age
    nh
    bun
    opentofu
    kind
    kubectl
  ];
}
