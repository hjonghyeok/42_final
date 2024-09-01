#!/bin/bash

cc -Wall -Werror -Wextra first_word.c

answers=./answers

tests=("FOR PONY" "this        ...       is sparta, then again, maybe    not" "   " "  lorem,ipsum  ")

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

./a.out "a" "b" | cat -e > "output4"

if diff -c "output4" "${answers}/answer4" > /dev/null; then
    echo -e "test4 \033[0;32mOK:)\033[0m"
    rm "output4"
else
    echo -e "test4 \033[0;31mKO:)\033[0m"
fi

rm a.out