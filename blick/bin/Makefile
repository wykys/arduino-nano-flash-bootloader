# wykys Make file for AVR

NAME = PRJ
DEVICE=atmega328p
CC=avr-gcc
CFLAGS = -g -Wall -mcall-prologues -mmcu=$(DEVICE) -Os


OBJCOPY  = avr-objcopy
OBJDUMP  = avr-objdump
BINSIZE = avr-size
AS = avr-as
RM = rm -rf

SRC = src/
DEP = dependence.list
OBJFILES = $(shell find ../$(SRC) -name '*.c' -printf '%f ' | sed -e 's/\.c/\.o/g')

.PHONY: dependence clean

# build all
all: $(NAME)
# genereting dependence
$(DEP): ../$(SRC)*.c
	$(CC) -MM ../$(SRC)*.c > $(DEP)
# include genereted dependence
-include $(DEP)
# create object modules
%.o : ../$(SRC)%.c
	$(CC) $(CFLAGS) -c $< -o $@
# create ELF
$(NAME).elf: $(DEP) $(OBJFILES)
	$(CC) $(CFLAGS) $(OBJFILES) -o $@
# create HEX
$(NAME).hex: $(NAME).elf
	$(OBJCOPY) -R .eeprom -O ihex $(NAME).elf $(NAME).hex
# disassembly EFL
$(NAME).lss: $(NAME).elf
	$(OBJDUMP)  -h -S $(NAME).elf > $@
# analyze size ELF
$(NAME): $(NAME).elf $(NAME).hex $(NAME).lss
	$(BINSIZE) $(NAME).elf
# clean files
clean:
	$(RM) *.o *.list *.elf *.hex *.lss
