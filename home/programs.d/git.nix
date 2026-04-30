{info, ...}: {
  programs = {
    gh.enable = true;
    git = {
      enable = true;
      settings = {
        user.name = info.git.username;
        user.email = info.git.email;
        safe.directory = "*";
        init.defaultBranch = "main";
        gpg.format = "ssh";
        user.signingkey = info.git.sign-key;
        commit.gpgsign = true;
      };
    };
  };
}
