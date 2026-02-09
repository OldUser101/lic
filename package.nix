{
  lib,
  stdenv,
  perl,
}:

stdenv.mkDerivation {
  pname = "lic";
  version = "0.1";
  src = ./.;

  nativeBuildInputs = [ perl ];

  installPhase = ''
    make install PREFIX=$out
  '';

  meta = {
    description = "Generate license text from templates";
    license = lib.licenses.bsd2;
    platforms = lib.platforms.unix;
  };
}
