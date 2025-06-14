#!/bin/bash

read -p "Please enter a sentence: " sentence

# Breake the sentence into words
words=($sentence)

# Reverse the order of words
reversed_sentence=""
for (( i=${#words[@]}-1; i>=0; i-- )); do
    reversed_sentence+="${words[i]} "
done

echo "Reversed sentence: $reversed_sentence"