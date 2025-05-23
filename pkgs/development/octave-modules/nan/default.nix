{
  buildOctavePackage,
  lib,
  fetchurl,
  blas,
}:

buildOctavePackage rec {
  pname = "nan";
  version = "3.7.0";

  src = fetchurl {
    url = "mirror://sourceforge/octave/${pname}-${version}.tar.gz";
    sha256 = "sha256-d9J6BfNFeM5LtMqth0boSPd9giYU42KBnxrsUCmKK1s=";
  };

  buildInputs = [
    blas
  ];

  meta = {
    homepage = "https://gnu-octave.github.io/packages/nan/";
    license = lib.licenses.gpl3Plus;
    maintainers = with lib.maintainers; [ KarlJoad ];
    description = "Statistics and machine learning toolbox for data with and w/o missing values";
  };
}
