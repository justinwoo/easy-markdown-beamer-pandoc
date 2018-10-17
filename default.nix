let
  pkgs = import <nixpkgs> {};

  texlive = pkgs.texlive.combine {
    inherit (pkgs.texlive)
    scheme-small
    noto
    mweights
    cm-super
    cmbright
    fontaxes
    beamer;
  };
in {
  slides = pkgs.stdenv.mkDerivation {
    name = "slides";
    src = ./.;

    buildInputs = [
      texlive
      pkgs.pandoc
      pkgs.watchexec
    ];
  };
}
