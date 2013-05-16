CC := gcc
CFLAGS := -pipe -Wall -O2 -fomit-frame-pointer \
          `imlib2-config --cflags` -I/usr/X11R7/include
LDFLAGS :=  -Wl,-O1 \
            `imlib2-config --libs` -L/usr/X11R7/lib
PRODUCTS := thumb

.PHONY: clean

all:    $(PRODUCTS)

clean:
	rm -f *.o

mrproper: clean
	rm -f $(PRODUCTS)

rebuild: mrproper all

thumb.o: thumb.c
	$(CC) $(CFLAGS) -c $^ -o $@

thumb: thumb.o
	$(CC) $(CFLAGS) $(LDFLAGS) $^ -o $@
	strip $@

