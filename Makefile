.PHONY: build
build:
	cd src && faas-cli build --shrinkwrap -f of-watchdog.yml && \
	cp -r build/of-watchdog/* ../
