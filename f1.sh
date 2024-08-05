#!/bin/bash

# Function to perform arithmetic operations
perform_operation() {
    local num1=$1
    local num2=$2
    local operation=$3

    case $operation in
        +)
            echo "Result: $(echo "$num1 + $num2" | bc)"
            ;;
        -)
            echo "Result: $(echo "$num1 - $num2" | bc)"
            ;;
        \*)
            echo "Result: $(echo "$num1 * $num2" | bc)"
            ;;
        /)
            if [ "$num2" -eq 0 ]; then
                echo "Error: Division by zero is not allowed."
            else
                echo "Result: $(echo "scale=2; $num1 / $num2" | bc)"
            fi
            ;;
        *)
            echo "Invalid operation. Use +, -, *, or /."
            ;;
    esac
}

# Read numbers and operation from user
echo "Enter the first number:"
read num1

echo "Enter the second number:"
read num2

echo "Enter the operation (+, -, *, /):"
read operation

# Validate input
if ! [[ "$num1" =~ ^-?[0-9]+(\.[0-9]+)?$ ]] || ! [[ "$num2" =~ ^-?[0-9]+(\.[0-9]+)?$ ]]; then
    echo "Invalid input: Please enter valid numbers."
    exit 1
fi

# Perform the operation
perform_operation "$num1" "$num2" "$operation"

