#!/bin/bash

cc -Wall -Werror -Wextra union.c

answers=answers

tests=("zpadinton" "ddf6vewg64f" "rien")
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

./a.out | cat -e > "output4"

if diff -c "output4" "${answers}/answer4" > /dev/null; then
    echo -e "test4 \033[0;32mOK:)\033[0m"
    rm "output4"
else
    echo -e "test4 \033[0;31mKO:)\033[0m"
fi

./a.out "rien" | cat -e > "output5"

if diff -c "output5" "${answers}/answer5" > /dev/null; then
    echo -e "test5 \033[0;32mOK:)\033[0m"
    rm "output5"
else
    echo -e "test5 \033[0;31mKO:)\033[0m"
fi

rm a.out