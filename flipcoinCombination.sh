#!/bin/bash

counter=0
total_heads=0
total_tails=0
total_first_comb=0
total_second_comb=0
total_third_comb=0
total_fourth_comb=0

declare -A singlet

singlet[head]=" "
singlet[tails]=" "
singlet[h_per]=0
singlet[t_per]=0

declare -A double

doublet[first_combination]=" "
doublet[second_combination]=" "
doublet[third_combination]=" "
doublet[fourth_combination]=" "
doublet[first_per]=0
doublet[second_per]=0
doublet[third_per]=0
doublet[fourth_per]=0


read -p "Enter how many times you want flip the coin  " FLIP

while [ $counter -ne $FLIP ]
do
	coin_1=$((RANDOM%2))
	coin_2=$((RANDOM%2))
	if [ $coin_1 -eq 1 ]
	then
		singlet[head]="H"
		((total_heads++))
		if [ $coin_2 -eq 1 ]
		then
			((total_first_comb++))
			doublet[first_combination]="HH"
		else
			((total_second_comb++))
			doublet[second_combination]="HT"
		fi
	else
		singlet[tails]="T"
		((total_tails++))
		 if [ $coin_2 -eq 1 ]
		then
			  ((total_third_comb++))
			   doublet[third_combination]="TH"
		else
			((total_fourth_comb++))
			doublet[fourth_combination]="TT"
		fi
	fi

        ((counter++))
done

echo "Singlet Combination" ${singlet[head]} ${singlet[tails]}

singlet[h_per]=$(echo $total_heads $FLIP | awk '{print ($1/$2)*100}')
echo "Percentage of Head ="${singlet[h_per]}

singlet[t_per]=$(echo $total_tails $FLIP | awk '{print ($1/$2)*100}')
echo "Percentage of Tail =" ${singlet[t_per]}

echo "-------------------------------------"

echo "Doublet Combination HH HT TH TT"

doublet[first_per]=$(echo $total_first_comb $FLIP | awk '{print ($1/$2)*100}')
echo "Percentage of HH Combination ="${doublet[first_per]}

doublet[second_per]=$(echo $total_second_comb $FLIP | awk '{print ($1/$2)*100}')
echo "Percentage of HT Combination ="${doublet[second_per]}

doublet[third_per]=$(echo $total_third_comb $FLIP | awk '{print ($1/$2)*100}')
echo "Percentage of TH Combination ="${doublet[third_per]}

doublet[fourth_per]=$(echo $total_fourth_comb $FLIP | awk '{print ($1/$2)*100}')
echo "Percentage of TT Combination ="${doublet[fourth_per]}

