#include "../lib/settings.h"
#include <util/delay.h>
#include <avr/io.h>

int main()
{

	DDRB = 0xFF;

	while (1)
	{
		PORTB = 0xFF;
		_delay_ms(250);
		PORTB = 0;
		_delay_ms(250);
	}

	return 0;
}
