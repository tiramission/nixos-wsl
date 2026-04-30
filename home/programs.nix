{info, ...}: {
  imports = [
    ./programs.d/zsh.nix
    ./programs.d/git.nix
    ./programs.d/vim.nix
  ];

  programs = {
    ripgrep.enable = true;
  };
}
