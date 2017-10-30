#!/bin/bash
# wykys arduino nano (ATmega328P) china copie 16MHz flash bootloader
chip='m328p'
isp='avrisp2'
url='optiboot/optiboot/bootloaders/optiboot/'
bootloader='optiboot_atmega328.hex'

cd /tmp
git clone https://github.com/Optiboot/optiboot.git
cd $url
make clean
make atmega328

# test connection
avrdude -p $chip -c $isp

# write fuses
avrdude -p $chip -c $isp -U lfuse:w:0xff:m -U hfuse:w:0xde:m -U efuse:w:0xff:m

# write bootloader
avrdude -p $chip -c $isp -U flash:w:$bootloader:i

rm /tmp/optiboot -rf
