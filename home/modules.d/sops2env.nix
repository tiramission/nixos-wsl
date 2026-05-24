{
  config,
  lib,
  pkgs,
  ...
}:
with lib; {
  options.sops2env = {
    enable = mkEnableOption "auto export sops secret to env" // {default = true;};
    variables = mkOption {
      type = types.attrsOf types.str;
      default = {};
      description = ''
        key: env name
        val: sops.secrets' name
      '';
      example = {GH_TOKEN = "gh-token";};
    };
  };
  config = mkIf config.sops2env.enable {
    # enable sops secrets
    sops.secrets = builtins.listToAttrs (
      map (secretName: nameValuePair secretName {})
      (unique (attrValues config.sops2env.variables))
    );

    # generate env shell
    sops.templates."sops.env".content = lib.concatStringsSep "\n" (
      map
      (
        name: let
          secretName = config.sops2env.variables.${name};
        in "export ${name}=${lib.escapeShellArg config.sops.placeholder.${secretName}}"
      )
      (builtins.attrNames config.sops2env.variables)
    );

    # setup env
    programs.zsh.initContent = mkIf config.programs.zsh.enable ''
      source ${config.sops.templates."sops.env".path}
    '';
    programs.bash.initExtra = mkIf config.programs.bash.enable ''
      source ${config.sops.templates."sops.env".path}
    '';
  };
}
