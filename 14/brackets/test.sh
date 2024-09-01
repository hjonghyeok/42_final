#!/bin/bash

cc -Wall -Werror -Wextra bracket.c

answers=./answers

tests=("(())" "{[}" "(asdasdsadasd)" "[asd]ffdsfa{]" "([(]())")

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