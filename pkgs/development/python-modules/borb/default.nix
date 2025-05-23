{
  lib,
  stdenv,
  buildPythonPackage,
  cryptography,
  fetchFromGitHub,
  fonttools,
  lxml,
  matplotlib,
  pandas,
  pillow,
  python-barcode,
  pythonOlder,
  qrcode,
  pytestCheckHook,
  requests,
  setuptools,
}:

buildPythonPackage rec {
  pname = "borb";
  version = "2.1.25";
  pyproject = true;

  disabled = pythonOlder "3.6";

  src = fetchFromGitHub {
    owner = "jorisschellekens";
    repo = "borb";
    tag = "v${version}";
    hash = "sha256-eVxpcYL3ZgwidkSt6tUav3Bkne4lo1QCshdUFqkA0wI=";
  };

  # ModuleNotFoundError: No module named '_decimal'
  postPatch = lib.optionalString stdenv.hostPlatform.isDarwin ''
    grep -Rl 'from _decimal' tests/ | while read -r test_file; do
      substituteInPlace "$test_file" \
        --replace-fail 'from _decimal' 'from decimal'
    done
  '';

  build-system = [ setuptools ];

  dependencies = [
    cryptography
    fonttools
    lxml
    pillow
    python-barcode
    qrcode
    requests
    setuptools
  ];

  nativeCheckInputs = [
    matplotlib
    pandas
    pytestCheckHook
  ];

  pythonImportsCheck = [ "borb.pdf" ];

  disabledTests = [
    "test_code_files_are_small"
    "test_image_has_pdfobject_methods"
  ];

  disabledTestPaths = [
    # Tests require network access
    "tests/pdf/"
    "tests/toolkit/"
    "tests/license/"
  ];

  meta = {
    description = "Library for reading, creating and manipulating PDF files in Python";
    homepage = "https://borbpdf.com/";
    changelog = "https://github.com/jorisschellekens/borb/releases/tag/v${version}";
    license = lib.licenses.agpl3Only;
    maintainers = with lib.maintainers; [ getchoo ];
  };
}
