# Set the C compiler to GCC
CC=gcc

# Set the usual C flags
CFLAGS=-Wall -Wextra -g -O2

all:
	cd src
	$(CC) $(CFLAGS) -o ./bin/easrelay easrelay.c
	cd ..

deb: all
	@echo "Building Debian package..."
	mkdir -p easrelay-deb/usr/local/bin
	cp ./bin/easrelay ./easrelay-deb/usr/local/bin
	cd easrelay-deb
	mkdir DEBIAN
	cp ./debian/control ./DEBIAN
	touch ./DEBIAN/postinst
	chmod +x ./DEBIAN/postinst
	cd ..
	dpkg-deb --build easrelay-deb