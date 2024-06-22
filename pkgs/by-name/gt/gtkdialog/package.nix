{
  lib,
  stdenv,
  fetchFromGitHub,
  meson,
  ninja,
  pkg-config,
  bison,
  flex,
  wrapGAppsHook3,
  vte,
  gtk-layer-shell,
}:

stdenv.mkDerivation rec {
  pname = "gtkdialog";
  version = "0.8.5d";

  src = fetchFromGitHub {
    owner = "puppylinux-woof-CE";
    repo = "gtkdialog";
    rev = version;
    hash = "sha256-Mox6P+mZnq7tEpOBYh+yKkTpP7nDHaLaPTzubauvnt0=";
  };

  nativeBuildInputs = [
    meson
    ninja
    pkg-config
    bison
    flex
    wrapGAppsHook3
  ];

  buildInputs = [
    vte
    gtk-layer-shell
  ];

  meta = {
    homepage = "https://github.com/puppylinux-woof-CE/gtkdialog";
    # community links: http://murga-linux.com/puppy/viewtopic.php?t=111923
    description = "Small utility for fast and easy GUI building from many scripted and compiled languages";
    mainProgram = "gtkdialog";
    license = lib.licenses.gpl2Plus;
    maintainers = with lib.maintainers; [ aleksana ];
    platforms = lib.platforms.linux;
  };
}
