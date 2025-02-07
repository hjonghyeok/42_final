#!/bin/bash

cc -Wall -Werror -Wextra maff_revalpha.c -o maff_revalpha

./maff_revalpha| cat -e > output

if diff -c output answer > /dev/null; then
    echo -e "\033[0;32mOK:)\033[0m"
else
    echo -e "\033[0;31mKO:)\033[0m"
fi

rm output maff_revalpha
