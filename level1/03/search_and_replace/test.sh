#!/bin/bash

cc -Wall -Werror -Wextra search_and_replace.c

answers=./answers

ar1=("Papache est un sabre" "zaz" "zaz" "ZoZ eT Dovid oiME le METol." "wNcOre Un ExEmPle Pas Facilw a Ecrirw ")
ar2=("a"                    "art" "r"   "o"                           "w")
ar3=("o"                    "zul" "u"   "a"                           "e")

for i in "${!ar1[@]}"; do
    a1=${ar1[$i]}
    a2=${ar2[$i]}
    a3=${ar3[$i]}
    
    ./a.out "${a1}" "${a2}" "${a3}" | cat -e > "output${i}"

    if diff -c "output${i}" "${answers}/answer${i}" > /dev/null; then
        echo -e "test${i} \033[0;32mOK:)\033[0m"
        rm "output${i}"
    else
        echo -e "test${i} \033[0;31mKO:)\033[0m"
    fi
done

./a.out "jacob" "a" "b" "c" "e" | cat -e > "output5"

if diff -c "output5" "${answers}/answer5" > /dev/null; then
    echo -e "test5 \033[0;32mOK:)\033[0m"
    rm "output5"
else
    echo -e "test5 \033[0;31mKO:)\033[0m"
fi

rm a.out