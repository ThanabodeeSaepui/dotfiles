{ inputs, ... }:
{
  nixpkgs.overlays = [
    inputs.nur.overlays.default
    (final: prev: {
      openldap = prev.openldap.overrideAttrs (old: {
        doCheck = false;
      });
    })
  ];
}
