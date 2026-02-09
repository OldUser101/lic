PREFIX ?= /usr/local
BINDIR = $(PREFIX)/bin
DATADIR = $(PREFIX)/share/lic

.PHONY: all install uninstall

all:
	@echo "Run 'make install' to install lic."

install:
	mkdir -p $(DESTDIR)$(BINDIR)
	mkdir -p $(DESTDIR)$(DATADIR)
	install -m 0755 lic.pl $(DESTDIR)$(BINDIR)/lic
	install -m 0644 templates/* $(DESTDIR)$(DATADIR)/

uninstall:
	rm -rf $(DESTDIR)$(BINDIR)
	rm -rf $(DESTDIR)$(DATADIR)

