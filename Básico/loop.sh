#!/usr/bin/env bash

echo "----------- FOR 1"
for (( i=0; i<10; i++ )); do
	echo $i
done

echo "----------- FOR 2 (seq)"

for i in $(seq 10)
do
	echo $i
done

echo "----------- FOR 3 (array)"

Frutas=(
'laranja'
'Ameixa'
'Abacaxi'
'Melancia'
'jabuticaba'
)

for i in ${Frutas[@]}
do
	echo $i
done

echo "----------- While"
counter=0
while [[ $counter -lt ${#Frutas[@]} ]]
do
	echo $counter
	counter=$(($counter+1)) # counter++
done
	
