{ inputs, pkgs, ... }:
let 
  yazi = inputs.yazi;
in 
{
  programs.yazi = {
    enable = true;
    # You can omit this if you use overlays
    package = yazi.packages.${pkgs.system}.default.override {
      _7zz = pkgs._7zz-rar; # Support for RAR extraction
    };
  };
}
