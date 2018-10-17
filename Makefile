.PHONY: build
build:
	nix-shell --run 'make slides'
slides:
	pandoc -t beamer source.md -o output.pdf
watch:
	nix-shell --run 'watchexec -e md make slides'
