#!/bin/bash

cc -Wall -Werror -Wextra ft_countdown.c -o ft_countdown

./ft_countdown | cat -e > output

if diff -c output answer > /dev/null; then
    echo "\033[0;32mOK:)\033[0m"
else
    echo "\033[0;31mKO:)\033[0m"
fi

rm output ft_countdown
