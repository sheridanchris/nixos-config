exec nix build --no-link .#homeConfigurations.christian.activationPackage
exec "$(nix path-info .#homeConfigurations.christian.activationPackage)"/activate
