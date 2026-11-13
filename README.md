# Rebuild
```bash
nix flake update    # Update
sudo nixos-rebuild switch --flake .
```

# Setup
```bash
cp /etc/nixos/hardware-configuration.nix hardware-configuration.nix
```

## Cleanup
```bash
nix-env --delete-generations +2
sudo nix-collect-garbage -d
nix-store --gc
```

```bash
fwupdmgr get-devices          # what fwupd sees (SSD, dock, TPM, …)
sudo fwupdmgr refresh --force
sudo fwupdmgr get-updates
sudo fwupdmgr update          # reboots into a capsule to flash
```
