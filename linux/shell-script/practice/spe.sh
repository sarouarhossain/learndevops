#! /bin/bash
echo "Enter decimal: "
read Deci
echo "Binary of $Deci is: "
echo "obase=2; ibase=10; $Deci" | bc
echo "Hexadecimal of $Deci is: "
echo "obase=16; ibase=10; $Deci" | bc
echo "Octal of $Deci is: "
echo "obase=8; ibase=10; $Deci" | bc
echo "Base5 of $Deci is: "
echo "obase=5; ibase=10; $Deci" | bc