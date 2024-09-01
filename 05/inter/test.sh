#!/bin/bash

cc -Wall -Werror -Wextra inter.c

answers=./answers

tests=("padinton" "ddf6vewg64f" "rien")
tests2=("paqefwtdjetyiytjneytjoeyjnejeyj" "gtwthgdwthdwfteewhrtag6h4ffdhsd" "cette phrase ne cache rien")

for i in "${!tests[@]}"; do
    test_name=${tests[$i]}
    test2=${tests2[$i]}
    
    ./a.out "${test_name}" "${test2}" | cat -e > "output${i}"

    if diff -c "output${i}" "${answers}/answer${i}" > /dev/null; then
        echo -e "test${i} \033[0;32mOK:)\033[0m"
        rm "output${i}"
    else
        echo -e "test${i} \033[0;31mKO:)\033[0m"
    fi
done

rm a.out