{
  lib,
  stdenv,
  fetchFromGitHub,
  ncurses,
  pkg-config,
}:

stdenv.mkDerivation rec {
  pname = "ttyplot";
  version = "1.7.2";

  src = fetchFromGitHub {
    owner = "tenox7";
    repo = "ttyplot";
    rev = version;
    hash = "sha256-zTbcl8hM/XYdkV8V/BCQ94fuFXWOMGdQZeowKRhvYNo=";
  };

  nativeBuildInputs = [
    pkg-config
  ];

  buildInputs = [
    ncurses
  ];

  makeFlags = [ "PREFIX=$(out)" ];

  meta = with lib; {
    description = "Simple general purpose plotting utility for tty with data input from stdin";
    homepage = "https://github.com/tenox7/ttyplot";
    license = licenses.asl20;
    platforms = platforms.all;
    maintainers = with maintainers; [ lassulus ];
    mainProgram = "ttyplot";
  };
}
