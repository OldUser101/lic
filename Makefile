PREFIX ?= /usr/local
BINDIR = $(PREFIX)/bin
DATADIR = $(PREFIX)/share/lic

.PHONY: all install uninstall

all:
	@echo "Run 'make install' to install lic."

install:
	mkdir -p $(BINDIR)
	mkdir -p $(DATADIR)
	install -m 0755 lic.pl $(BINDIR)/lic
	install -m 0644 templates/* $(DATADIR)/

uninstall:
	rm -rf $(BINDIR)/lic
	rm -rf $(DATADIR)

