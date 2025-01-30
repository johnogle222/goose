{
  mkShell,
  lib,
  cargo,
  dbus,
  just,
  libxcb,
  openssl,
  pkg-config,
}: mkShell {
  name = "goose-ai";

  packages = [
    cargo
    just
    openssl
  ];

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

  LD_LIBRARY_PATH = lib.makeLibraryPath [ openssl ];
}
