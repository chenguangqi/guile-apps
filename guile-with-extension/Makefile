CFLAGS  = $(shell guile-config compile) -fPIC
LDFLAGS = $(shell guile-config link) -shared

OBJS       := libguile-bessel.so
INSTALLDIR := $(shell guile-config info extensiondir)

all : libguile-bessel.so

libguile-bessel.so : bessel.o
	$(CC) $(LDFLAGS) -o libguile-bessel.so $^ $(LOADLIBS) $(LDLIBS)

install: libguile-bessel.so
	sudo install -m 755 -o root $(OBJS) $(INSTALLDIR)

.PHONY : all clean
clean :
	rm -rf $(OBJS) *.o
