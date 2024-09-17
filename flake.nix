{
  description = "A flake to get onto the University of Manchester Wifi";

  inputs.nixpkgs.url = "nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }: let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in {
    packages.x86_64-linux.default = pkgs.stdenv.mkDerivation {
      name = "eduroam-uom";
      buildInputs = [ pkgs.python3 ];
      dontUnpack = true;
      installPhase = "install -Dm755 ${./eduroam-linux-TUoM-manchester.ac.uk.py} $out/bin/eduroam-uom";
    };
  };
}
