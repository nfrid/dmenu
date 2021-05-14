# dmenu - dynamic menu
# See LICENSE file for copyright and license details.

include config.mk

SRC = drw.c dmenu.c stest.c util.c
DSCRIPTS = 
OBJ = $(SRC:.c=.o)

all: options dmenu

options:
	@echo dmenu build options:
	@echo "CFLAGS   = $(CFLAGS)"
	@echo "LDFLAGS  = $(LDFLAGS)"
	@echo "CC       = $(CC)"

.c.o:
	$(CC) -c $(CFLAGS) $<

$(OBJ): config.h config.mk drw.h

dmenu: dmenu.o drw.o util.o
	$(CC) -o $@ dmenu.o drw.o util.o $(LDFLAGS)

clean:
	rm -f dmenu $(OBJ)

install: all
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp -f dmenu dmenu_path dmenu_run dmenu_run_history $(DESTDIR)$(PREFIX)/bin
	chmod 755 $(DESTDIR)$(PREFIX)/bin/dmenu
	chmod 755 $(DESTDIR)$(PREFIX)/bin/dmenu_path
	chmod 755 $(DESTDIR)$(PREFIX)/bin/dmenu_run
	chmod 755 $(DESTDIR)$(PREFIX)/bin/dmenu_run_history

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/dmenu
	rm -f	$(DESTDIR)$(PREFIX)/bin/dmenu_path
	rm -f	$(DESTDIR)$(PREFIX)/bin/dmenu_run
	rm -f	$(DESTDIR)$(PREFIX)/bin/dmenu_run_history

.PHONY: all options clean dist install uninstall
