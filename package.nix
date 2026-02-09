{
  lib,
  stdenv,
  perl,
  makeWrapper,
}:

stdenv.mkDerivation {
  pname = "lic";
  version = "0.1";
  src = ./.;

  nativeBuildInputs = [
    perl
    makeWrapper
  ];

  installPhase = ''
    make install PREFIX=$out
    wrapProgram $out/bin/lic \
      --set LICPATH $out/share/lic
  '';

  meta = {
    description = "Generate license text from templates";
    license = lib.licenses.bsd2;
    platforms = lib.platforms.unix;
  };
}
