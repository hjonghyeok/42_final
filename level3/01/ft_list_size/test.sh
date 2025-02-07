#!/bin/bash

cc -Wall -Werror -Wextra ft_list_size.c ./answers/main.c

answers=./answers

./a.out | cat -e > output0

if diff -c "output0" "${answers}/answer0" > /dev/null; then
    echo -e "test \033[0;32mOK:)\033[0m"
    rm "output0"
else
    echo -e "test \033[0;31mKO:)\033[0m"
fi

rm a.out