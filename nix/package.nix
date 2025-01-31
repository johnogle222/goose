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

  cargoHash = "sha256-ytGriAhu1HnFfqM7yHR6MnL90d8s+77VVMg98NIUw2Y=";

  nativeBuildInputs =
    [
      cargo
      dbus
      libxcb
      openssl
      pkg-config
    ];

  # Use vendored dependencies
  vendorSha256 = lib.fakeSha256;

  buildInputs =
    [
      openssl
      dbus
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
