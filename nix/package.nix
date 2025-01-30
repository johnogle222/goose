{
  stdenv,
  rustPlatform,
  lib,
  cargo,
  dbus,
  libxcb,
  openssl,
  pkg-config,
}: rustPlatform.buildRustPackage {
  pname = "goose-cli";
  version = "1.0";

  src = ../.;

  cargoHash = lib.fakeHash;

  nativeBuildInputs =
    [
      cargo
      dbus
      libxcb
      openssl
      pkg-config
    ];

  buildInputs =
    [
      openssl
    ];

  outputs = [
    "out"
  ];

  meta = {
    homepage = "https://github.com/block/goose";
    license = lib.licenses.asl20;
    mainProgram = "goose";
  };
}
