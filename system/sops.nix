{
  config,
  inputs,
  ...
}: {
  imports = [inputs.sops-nix.nixosModules.default];

  sops.defaultSopsFile = ../secrets/nixos.yaml;
  sops.age.keyFile = "/home/${config.wsl.defaultUser}/.config/sops/age/keys.txt";
  sops.secrets = {
  };
}
