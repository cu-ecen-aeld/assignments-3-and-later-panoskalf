# CROSS_COMPILE = aarch64-none-linux-gnu-
CROSS_COMPILE = 
CC = gcc
CFLAGS = -Wall

all: clean writer

writer:
	$(CROSS_COMPILE)$(CC) writer.c -o writer $(CFLAGS)

clean:
	rm -f writer