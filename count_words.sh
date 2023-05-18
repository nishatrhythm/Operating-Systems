#!/bin/bash

# Get the sentence from the user.
echo "Enter a sentence:"
read sentence

# Count the number of words in the sentence.
word_count=$(echo "$sentence" | wc -w)

# Display the number of words.
echo "The sentence contains $word_count words."
