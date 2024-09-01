#!/bin/bash

cc -Wall -Werror -Wextra wdmatch.c

answers=answers

tests=("faya" "faya" "quarante deux" "error" "")
tests2=("fgvvfdxcacpolhyghbreda" "fgvvfdxcacpolhyghbred" "qfqfsudf arzgsayns tsregfdgs sjytdekuoixq " "rrerrrfiiljdfxjyuifrrvcoojh" "")

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