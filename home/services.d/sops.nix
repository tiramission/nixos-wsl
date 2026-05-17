{
  config,
  inputs,
  ...
}: {
  imports = [
    inputs.sops-nix.homeManagerModules.default
  ];

  sops.defaultSopsFile = "${inputs.self}/secrets/home.yaml";
  sops.age.keyFile = "${config.home.homeDirectory}/.config/sops/age/keys.txt";
  sops.secrets = {
  };
}
