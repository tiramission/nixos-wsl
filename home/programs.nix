{
  info,
  lib,
  ...
}: let
  enablePrograms = ps: lib.genAttrs ps (_: {enable = true;});
in {
  imports = [
    ./programs.d/zsh.nix
    ./programs.d/git.nix
    ./programs.d/vim.nix
    ./programs.d/uv.nix
    ./programs.d/go.nix
  ];

  programs = enablePrograms [
    "ripgrep"
    "fd"
  ];
}
