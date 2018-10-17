.PHONY: build update-nixpkgs
build:
	nix-shell --pure --run 'make slides'
slides:
	pandoc -t beamer source.md -o output.pdf
watch:
	nix-shell --pure --run 'watchexec -e md make slides'
repl:
	nix repl nix/nixpkgs-pinned

NIXPKGS_OWNER?=NixOS
NIXPKGS_REPO?=nixpkgs
NIXPKGS_REV?=7df10f388dabe9af3320fe91dd715fc84f4c7e8a
update-nixpkgs:
	nix-shell --pure nix/scripts/generate-nixpkgs-json.nix \
		--argstr owner $(NIXPKGS_OWNER) \
		--argstr repo $(NIXPKGS_REPO) \
		--argstr rev $(NIXPKGS_REV)
