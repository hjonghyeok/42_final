void	print_bits(unsigned char octet);

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
        print_bits(atoi(argv[1]));
}