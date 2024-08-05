#!/bin/bash

# Function to calculate tax
calculate_tax() {
    local income=$1
    local tax=0

    if (( income <= 20000 )); then
        tax=0
    elif (( income <= 40000 )); then
        tax=$(echo "scale=2; $income * 0.05" | bc)
    else
        tax=$(echo "scale=2; $income * 0.10" | bc)
    fi

    echo "Tax for an income of $income is: $tax"
}

# Read income from user
read -p "Enter your income: " income

# Validate if input is a number
if ! [[ $income =~ ^[0-9]+([.][0-9]+)?$ ]]; then
    echo "Invalid input. Please enter a valid number."
    exit 1
fi

# Call the function to calculate tax
calculate_tax $income
 
