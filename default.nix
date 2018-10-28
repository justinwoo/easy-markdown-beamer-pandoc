let
  pkgs = import ./nix/nixpkgs-pinned {};

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
  inherit pkgs;
  inherit texlive;

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
