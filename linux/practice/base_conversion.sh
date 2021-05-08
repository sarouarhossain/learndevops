#! /bin/bash
echo "Enter decimal: "
read input
echo "Binary of $input is: " "obase=2; ibase=10; $input" | bc
echo "obase=2; ibase=10; $input" | bc
echo "Hexadecimal of $input is: "
echo "obase=16; ibase=10; $input" | bc
echo "Octal of $input is: "
echo "obase=8; ibase=10; $input" | bc
echo "Base5 of $input is: "
echo "obase=5; ibase=10; $input" | bc
