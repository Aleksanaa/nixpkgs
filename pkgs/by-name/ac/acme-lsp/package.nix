{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:

buildGoModule rec {
  pname = "acme-lsp";
  version = "0.12.0";

  src = fetchFromGitHub {
    owner = "9fans";
    repo = "acme-lsp";
    rev = "refs/tags/v${version}";
    hash = "sha256-u7YtrBAqhObrjtoLJ/6OqTCj7/AK2Z+JS4tu9MCJk6E=";
  };

  vendorHash = "sha256-eytY3XNDU+IoExdXIRz8s6DO160vB353rV9DI1JFtd8=";

  # Tests aren't compatible with gopls
  # Not providing gopls to avoid further breakage
  checkFlags = [ "-skip=TestGo|TestServer" ];

  meta = {
    description = "Language Server Protocol tools for the acme text editor";
    homepage = "https://github.com/9fans/acme-lsp";
    license = lib.licenses.mit;
    mainProgram = "acme-lsp";
    maintainers = with lib.maintainers; [ aleksana ];
    platforms = lib.platforms.unix;
  };
}
