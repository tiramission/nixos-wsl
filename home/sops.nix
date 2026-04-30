{
  config,
  inputs,
  ...
}: {
  imports = [
    inputs.sops-nix.homeManagerModules.default
    ({
      lib,
      pkgs,
      ...
    }:
      with lib; let
        cfg = config.sops2env;
        envVars =
          mapAttrs (
            varName: secretName: "$(${pkgs.coreutils}/bin/cat ${config.sops.secrets.${secretName}.path} 2>/dev/null || :)"
          )
          cfg.variables;
      in {
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
        config = mkIf cfg.enable {
          sops.secrets = builtins.listToAttrs (
            map (secretName: nameValuePair secretName {})
            (unique (attrValues cfg.variables))
          );

          home.sessionVariables = envVars;
        };
      })
  ];

  sops.defaultSopsFile = ../secrets/home.yaml;
  sops.age.keyFile = "${config.home.homeDirectory}/.config/sops/age/keys.txt";
  sops.secrets = {
    ssh-key = {
      mode = "0600";
      path = "${config.home.homeDirectory}/.ssh/id_ed25519";
    };
    ssh-sign-key = {
      mode = "0600";
      path = "${config.home.homeDirectory}/.ssh/id_ed25519_sign";
    };
  };
}
