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
        "ssh"
      ];
      prompt.theme = "nicoulaj";
      ssh.identities = ["id_ed25519" "id_ed25519_sign"];
    };
  };
}
