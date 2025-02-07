#!/bin/bash

cc -Wall -Werror -Wextra aff_a.c -o aff_a

./aff_a | cat -e > output

if diff -c output answer > /dev/null; then
    echo -e "\033[0;32mOK:)\033[0m"
else
    echo -e "\033[0;31mKO:)\033[0m"
fi

rm output aff_a 
