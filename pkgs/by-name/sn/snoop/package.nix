{ lib
, stdenv
, fetchFromGitLab
, meson
, ninja
, pkg-config
, vala
, python3
, wrapGAppsHook4
, desktop-file-utils
, libadwaita
}:

stdenv.mkDerivation rec {
  pname = "snoop";
  version = "0.2";

  src = fetchFromGitLab {
    domain = "gitlab.gnome.org";
    owner = "philippun1";
    repo = "snoop";
    rev = version;
    hash = "sha256-ugHpV4MEdDZBORfZP5ZojAm9YZCKnOUIo8lCHag4ItE=";
  };

  postPatch = ''
    substituteInPlace build-aux/meson/postinstall.py \
      --replace-warn gtk-update-icon-cache gtk4-update-icon-cache
    patchShebangs --build build-aux/meson/postinstall.py
  '';

  nativeBuildInputs = [
    meson
    ninja
    pkg-config
    vala
    python3
    wrapGAppsHook4
    desktop-file-utils
  ];

  buildInputs = [
    libadwaita
  ];

  meta = with lib; {
    description = "Search through file contents in a given folder";
    homepage = "https://gitlab.gnome.org/philippun1/snoop";
    license = licenses.gpl3Plus;
    mainProgram = "snoop";
    maintainers = with maintainers; [ aleksana ];
    platforms = platforms.unix;
  };
}
