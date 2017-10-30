# Main AVR project Makefile
# wykys 9.9.2017

BIN = bin/

all:
	make -C $(BIN)
	avrdude -p m328p -c arduino -P /dev/ttyUSB0 -U flash:w:bin/PRJ.hex:i

clean:
	make -C $(BIN) $@
