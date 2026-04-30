{config, ...}: {
  sops2env.variables.GH_TOKEN = "gh-token";
  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
    };
    prezto = {
      enable = true;
      pmodules = [
        "environment"
        "terminal"
        "editor"
        "history"
        "directory"
        "utility"
        "git"
        "prompt"
        "syntax-highlighting"
      ];
      prompt.theme = "nicoulaj";
    };
  };
}
