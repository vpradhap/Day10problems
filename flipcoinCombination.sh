#!/bin/bash

counter=0
total_heads=0
total_tails=0

declare -A singlet

singlet[head]=" "
singlet[tails]=" "
singlet[h_per]=0
singlet[t_per]=0


read -p "Enter how many times you want flip the coin  " FLIP

while [ $counter -ne $FLIP ]
do
	coin_1=$((RANDOM%2))

	if [ $coin_1 -eq 1 ]
	then
		singlet[head]="H"
		((total_heads++))
	else
		singlet[tails]="T"
      ((total_tails++))
	fi
	((counter++))
done


echo "Singlet Combination" ${singlet[head]} ${singlet[tails]}

singlet[h_per]=$(echo $total_heads $FLIP | awk '{print ($1/$2)*100}')
echo "Percentage of Head ="${singlet[h_per]}

singlet[t_per]=$(echo $total_tails $FLIP | awk '{print ($1/$2)*100}')
echo "Percentage of Tail =" ${singlet[t_per]}

