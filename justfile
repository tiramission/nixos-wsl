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
