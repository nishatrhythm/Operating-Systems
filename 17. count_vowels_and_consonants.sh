#!/bin/bash

read -p "Enter a sentence: " sentence

# Convert the sentence to lowercase
sentence=${sentence,,}

# Initialize counters for vowels and consonants
vowels=0
consonants=0

# Loop through each character in the sentence
for ((i = 0; i < ${#sentence}; i++)); do
  # Get the current character
  char=${sentence:i:1}
  # Check if the character is a vowel
  if [[ $char =~ [aeiou] ]]; then
    ((vowels++))
  # Check if the character is a consonant
  elif [[ $char =~ [[:alpha:]] && ! $char =~ [aeiou] ]]; then
    ((consonants++))
  fi
done

echo "Number of vowels: $vowels"
echo "Number of consonants: $consonants"
