let
  default = import ./default.nix;
in {
  inherit (default)
    texlive;
  inherit (default.pkgs)
    pandoc
    watchexec;
}
