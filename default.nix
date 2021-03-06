{ compiler ? "ghc884"
, enableDhall ? false
, enableSwagger ? true
}:

let
  pkgs = import ./nix/nixpkgs.nix {
    overlays = [
      (import ./nix/overlays/haskell.nix { inherit compiler enableDhall enableSwagger; })
    ];
  };

in
{
  inherit (pkgs.haskell.packages."${compiler}")
    proto3-suite-boot
    proto3-suite
    ;
}
