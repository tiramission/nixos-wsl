{info, ...}: {
  imports = [
    ./programs.d/zsh.nix
    ./programs.d/git.nix
    ./programs.d/vim.nix
    ./programs.d/uv.nix
  ];

  programs = {
    ripgrep.enable = true;
    fd.enable = true;
  };
}
