#!/bin/bash

cc -Wall -Werror -Wextra ft_print_numbers.c ./answers/main.c

answers=./answers

./a.out | cat -e > "output${i}"

if diff -c "output${i}" "${answers}/answer${i}" > /dev/null; then
    echo -e "test${i} \033[0;32mOK:)\033[0m"
    rm "output${i}"
else
    echo -e "test${i} \033[0;31mKO:)\033[0m"
fi

rm a.out