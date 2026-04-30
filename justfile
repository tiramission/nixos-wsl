fmt:
        alejandra .

add: fmt
        git add .

repl:
	nix repl .#nixosConfigurations.nixos

wsl:
	sudo nix run ".#nixosConfigurations.nixos.config.system.build.tarballBuilder"

apply: add
        nh os switch .

gen-age SSHKEY:
	@mkdir -p ~/.config/sops/age
	cat {{SSHKEY}} | ssh-to-age -private-key > ~/.config/sops/age/keys.txt


