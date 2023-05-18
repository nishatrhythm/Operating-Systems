#!/bin/bash

echo "Please enter a file name:"
read filename

if [ -f "$filename" ]; then
  word_count=$(wc -w "$filename" | awk '{print $1}')
  line_count=$(wc -l "$filename" | awk '{print $1}')
  char_count=$(wc -m "$filename" | awk '{print $1}')

  echo "Word count: $word_count"
  echo "Line count: $line_count"
  echo "Character count: $char_count"
else
  echo "$filename is not a valid file."
fi
