#include <stdio.h>
#include "../ft_list.h"
#include <stdlib.h>

int		ft_list_size(t_list *begin_list);

t_list	*ft_create_elem(void *data)
{
	t_list	*creat_list;

	creat_list = (t_list *)malloc(sizeof(t_list));
	if (creat_list == NULL)
		return (NULL);
	creat_list->data = data;
	creat_list->next = NULL;
	return (creat_list);
}

t_list  *ft_list_push_strs(int size, char **strs)
{
    t_list *list;
    t_list *start;
    int i;

    if (size <= 0)
        return (0);
    i = 1;
    list = ft_create_elem(strs[0]);
    start = list;
    while (i < size)
    {
        list->next = ft_create_elem(strs[i]);
        list = list->next;
        i++;
    }
    return (start);
}

int		main(void)
{
	t_list	*begin;
	char	**strs;

	strs = malloc(sizeof(char*) * 5);
	strs[0] = "111";
	strs[1] = "222";
	strs[2] = "333";
	strs[3] = "444";
	strs[4] = "555";
	begin = ft_list_push_strs(5, strs);
	printf("%d\n", ft_list_size(begin));
    free(strs);
    char    **strs2;
	t_list	*begin2;
	strs2 = malloc(sizeof(char*) * 7);
	strs[0] = "111";
	strs[1] = "222";
	strs[2] = "333";
	strs[3] = "444";
	strs[4] = "555";
    strs[5] = "555";
    strs[6] = "555";
	begin2 = ft_list_push_strs(7, strs2);
	printf("%d\n", ft_list_size(begin2));
}
