#!/bin/bash

# Get the number from the user.
echo "Enter a number:"
read number

# Calculate the factorial.
factorial=1
for ((i = 1; i <= number; i++)); do
  factorial=$((factorial * i))
done

# Display the factorial.
echo "The factorial of $number is $factorial"
