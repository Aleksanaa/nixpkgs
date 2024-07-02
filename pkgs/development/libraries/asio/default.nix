{callPackage, ... } @ args:

callPackage ./generic.nix (args // {
  version = "1.24.0";
  hash = "sha256-iXaBLCShGGAPb88HGiBgZjCmmv5MCr7jsN6lKOaCxYU=";
})
