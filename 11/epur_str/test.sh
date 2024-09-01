#!/bin/bash

cc -Wall -Werror -Wextra epur_str.c

answers=./answers

tests=("vous voyez c'est facile d'afficher la meme chose" \
         " seulement          la c'est      plus dur ")

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

./a.out "comme c'est cocasse" "vous avez entendu, Mathilde ?" | cat -e > "output3"

if diff -c "output3" "${answers}/answer3" > /dev/null; then
    echo -e "test3 \033[0;32mOK:)\033[0m"
    rm "output3"
else
    echo -e "test3 \033[0;31mKO:)\033[0m"
fi

./a.out "" | cat -e > "output4"

if diff -c "output4" "${answers}/answer4" > /dev/null; then
    echo -e "test4 \033[0;32mOK:)\033[0m"
    rm "output4"
else
    echo -e "test4 \033[0;31mKO:)\033[0m"
fi

rm a.out