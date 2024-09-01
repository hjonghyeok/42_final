#include <unistd.h>
unsigned char swap_bits(unsigned char octet);

void	print_bits(unsigned char octet)
{
	int i;
	char c;

	i = 128;
	while (i > 0)
	{
		if (i > octet)
		{
			c = '0';
			i = i / 2;
			write(1, &c, 1);
		}
		else
		{
			c = '1';
			write(1, &c, 1);
			octet = octet - i;
			i = i / 2;
		}
	}
    write(1, "\n", 1);
}

int atoi(char *str)
{
    int i;
    int m;

    i = 0;
    int j = 0;
    m = 1;
    if (str[0] == '-')
    {
        m *= -1;
        i++;
    }
    while (str[i] >= '0' && str[i] <= '9')
    {
        j = j * 10 + (str[i] - 48);
        i++;
    }
    return (j * m);
}


int		main(int argc, char **argv)
{
    if (argc == 2)
        print_bits(swap_bits(atoi(argv[1])));
}
