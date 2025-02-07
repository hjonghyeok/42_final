#!/bin/bash

cc -Wall -Werror -Wextra rot_13.c

answers=./answers

tests=("abc" "My horse is Amazing." "AkjhZ zLKIJz , 23y ")

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