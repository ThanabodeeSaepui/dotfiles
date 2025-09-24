# Rebuild
```bash
nix flake update    # Update
sudo nixos-rebuild switch --flake .
nix-store --gc
```

# Setup
```bash
cp /etc/nixos/* .
```

```bash
nix-store --gc
```