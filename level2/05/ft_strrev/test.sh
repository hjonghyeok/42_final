#!/bin/bash

cc -Wall -Werror -Wextra ft_strrev.c ./answers/main.c

answers=./answers

tests=("abcdef" "  1 2 6" "-127   " "12345679" "987654321")

for i in "${!tests[@]}"; do
    test_name=${tests[$i]}
    
    ./a.out "${test_name}" | cat -e > "output${i}"

    if diff -c "output${i}" "${answers}/answer${i}" > /dev/null; then
        echo -e "test${i} \033[0;32mOK:)\033[0m"
        rm "output${i}"
    else
        echo -e "test${i} \033[0;31mKO:)\033[0m"
    fi
done

rm a.out