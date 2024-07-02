{ buildOctavePackage
, lib
, fetchurl
}:

buildOctavePackage rec {
  pname = "ga";
  version = "0.10.4";

  src = fetchurl {
    url = "mirror://sourceforge/octave/${pname}-${version}.tar.gz";
    hash = "sha256-hsrjh2rZFhP6WA+qaKjiGfJkDtT2nTlXlKr3jAJ5Y44=";
  };

  meta = with lib; {
    homepage = "https://octave.sourceforge.io/ga/index.html";
    license = licenses.gpl3Plus;
    maintainers = with maintainers; [ KarlJoad ];
    description = "Genetic optimization code";
  };
}
