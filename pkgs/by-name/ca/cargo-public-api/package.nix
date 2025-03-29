{
  lib,
  rustPlatform,
  fetchCrate,
  pkg-config,
  curl,
  openssl,
}:

rustPlatform.buildRustPackage rec {
  pname = "cargo-public-api";
  version = "0.44.2";

  src = fetchCrate {
    inherit pname version;
    hash = "sha256-Rdwn3izKSy5733KJw3OyGsBJ55xdxg9+MuI8ZNdei3s=";
  };

  useFetchCargoVendor = true;
  cargoHash = "sha256-11Y9BTtprv7EmBx7hsV8UnGDWmogj9azHOCAc/JdY7o=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [
    curl
    openssl
  ];

  # Tests fail
  doCheck = false;

  meta = with lib; {
    description = "List and diff the public API of Rust library crates between releases and commits. Detect breaking API changes and semver violations";
    mainProgram = "cargo-public-api";
    homepage = "https://github.com/Enselic/cargo-public-api";
    changelog = "https://github.com/Enselic/cargo-public-api/releases/tag/v${version}";
    license = licenses.mit;
    maintainers = with maintainers; [ matthiasbeyer ];
  };
}
