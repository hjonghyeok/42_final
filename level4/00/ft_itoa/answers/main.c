#include <stdio.h>

char	*ft_itoa(int nbr);

int main()
{
	printf("%s\n", ft_itoa(10));
	printf("%s\n", ft_itoa(-2147483648));
	printf("%s\n", ft_itoa(0));
	printf("%s\n", ft_itoa(2147483647));
	printf("%s\n", ft_itoa(-99));
	return (0);
}
