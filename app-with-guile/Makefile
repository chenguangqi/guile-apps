CFLAGS  = $(shell guile-config compile) -fPIC
LDFLAGS = $(shell guile-config link)

all : simple-guile

.PHONY : all clean
clean :
	rm -rf $(OBJS) simple-guile
