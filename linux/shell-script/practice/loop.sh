#! /bin/bash

# for loop
for i in {1..10..2}
do
  echo $i
done

# while loop
number=1
while [ $number -le 5 ]
do 
  echo Number: $number
  number=$((number + 1))
done