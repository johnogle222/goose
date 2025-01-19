{ lib, stdenv, ... }:

{
  stdenv.mkDerivation {
    pname = "goose-ai";
    version = "1.0";
    src = lib.fileset.toSource {
      root = ../.;
    };

    nativeBuildInputs =
      [
        cargo
        openssl
        pkg-config
      ];

    buildInputs =
      [
        openssl
      ];
  };
}
