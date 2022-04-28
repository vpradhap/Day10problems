#!/bin/bash

counter=0
index=0
total_heads=0
total_tails=0
total_first_comb=0
total_second_comb=0
total_third_comb=0
total_fourth_comb=0
total_triplet_first_comb=0
total_triplet_second_comb=0
total_triplet_third_comb=0
total_triplet_fourth_comb=0
total_triplet_fifth_comb=0
total_triplet_sixth_comb=0
total_triplet_seventh_comb=0
total_triplet_eigth_comb=0

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


declare -A triplet

triplet[first_combination]=" "
triplet[second_combination]=" "
triplet[third_combination]=" "
triplet[fourth_combination]=" "
triplet[fifth_combination]=" "
triplet[sixth_combination]=" "
triplet[seventh_combination]=" "
triplet[eigth_combination]=" "
triplet[first_per]=0
triplet[second_per]=0
triplet[third_per]=0
triplet[fourth_per]=0
triplet[fifth_per]=0
triplet[sixth_per]=0
triplet[seventh_per]=0
triplet[eigth_per]=0

read -p "Enter how many times you want flip the coin  " FLIP

while [ $counter -lt $FLIP ]
do
	coin_1=$((RANDOM%2))
	coin_2=$((RANDOM%2))
	coin_3=$((RANDOM%2))
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
	if [[ $coin_1 -eq 1 && $coin_2 -eq 1 ]]
	then
		if [ $coin_3 -eq 1 ]
		then
			((total_triplet_first_comb++))
			triplet[first_combination]="HHH"
		else
			((total_triplet_second_comb++))
			triplet[second_combination]="HHT"
		fi
	elif [[ $coin_1 -eq 1 && $coin_2 -eq 0 ]]
	then
		if [ $coin_3 -eq 1 ]
		then
			((total_triplet_third_comb++))
			triplet[third_combination]="HTH"
		else
			((total_triplet_fourth_comb++))
			triplet[fourth_combination]="HTT"
		fi
	elif [[ $coin_1 -eq 0 && $coin_2 -eq 1 ]]
	then
		if [ $coin_3 -eq 1 ]
		then
			((total_triplet_fifth_comb++))
			triplet[fifth_combination]="THH"
		else
			((total_triplet_sixth_comb++))
			triplet[sixth_combination]="THT"
		fi
	else
		if [[ $coin_1 -eq 0 && $coin_2 -eq 0 ]]
		then
			if [ $coin_3 -eq 1 ]
			then
				((total_triplet_seventh_comb++))
				triplet[seventh_combination]="TTH"
			else
				((total_triplet_eigth_comb++))
				triplet[eigth_combination]="TTT"
			fi
		fi
	fi

        ((counter++))
done
echo "Combination of Singlet,Doublet,Triplet"
echo "--------------------------------------"

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

echo "-----------------------------------------"

echo "Triplet Combination HHH HHT HTH HTT THH THT TTH TTT"

triplet[first_per]=$(echo $total_triplet_first_comb $FLIP | awk '{print ($1/$2)*100}')
echo "Percentage of HHH Combination ="${triplet[first_per]}

triplet[second_per]=$(echo $total_triplet_second_comb $FLIP | awk '{print ($1/$2)*100}')
echo "Percentage of HHT Combination ="${triplet[second_per]}

triplet[third_per]=$(echo $total_triplet_third_comb $FLIP | awk '{print ($1/$2)*100}')
echo "Percentage of HTH Combination ="${triplet[third_per]}

triplet[fourth_per]=$(echo $total_triplet_fourth_comb $FLIP | awk '{print ($1/$2)*100}')
echo "Percentage of HTT Combination ="${triplet[fourth_per]}

triplet[fifth_per]=$(echo $total_triplet_fifth_comb $FLIP | awk '{print ($1/$2)*100}')
echo "Percentage of THH Combination ="${triplet[fifth_per]}

triplet[sixth_per]=$(echo $total_triplet_sixth_comb $FLIP | awk '{print ($1/$2)*100}')
echo "Percentage of THT Combination ="${triplet[sixth_per]}

triplet[seventh_per]=$(echo $total_triplet_seventh_comb $FLIP | awk '{print ($1/$2)*100}')
echo "Percentage of TTH Combination ="${triplet[seventh_per]}

triplet[eigth_per]=$(echo $total_triplet_eigth_comb $FLIP | awk '{print ($1/$2)*100}')
echo "Percentage of TTT Combination ="${triplet[eigth_per]}


arr[((index))]=${singlet[h_per]}
arr[((index++))]=${singlet[t_per]}
arr[((index++))]=${doublet[first_per]}
arr[((index++))]=${doublet[second_per]}
arr[((index++))]=${doublet[third_per]}
arr[((index++))]=${doublet[fourth_per]}
arr[((index++))]=${triplet[first_per]}
arr[((index++))]=${triplet[second_per]}
arr[((index++))]=${triplet[third_per]}
arr[((index++))]=${triplet[fourth_per]}
arr[((index++))]=${triplet[fifth_per]}
arr[((index++))]=${triplet[sixth_per]}
arr[((index++))]=${triplet[seventh_per]}
arr[((index++))]=${triplet[eigth_per]}

echo ${arr[@]}


for(( i=0; i<${#arr[@]}; i++ ))
do
	for (( j=i+1; j<${#arr[@]}; j++ ))
	do
		if [[ ${arr[j]} > ${arr[i]} ]]
		then
			temp=${arr[j]}
			arr[$j]=${arr[i]}
			arr[$i]=$temp
		fi
	done
done

echo ${arr[@]}
max=${arr[0]}

case $max in
	${singlet[h_per]}) echo "Singlet Combination is Winner" ;;
	${singlet[t_per]}) echo "Singlet Combination is Winner" ;;
	${doublet[first_per]}) echo "Doublet Combination is Winner" ;;
	${doublet[second_per]}) echo "Doublet Combination is Winner" ;;
	${doublet[third_per]}) echo "Doublet Combination is Winner" ;;
	${doublet[fourth_per]}) echo "Doublet Combination is Winner"  ;;
	${triplet[first_per]}) echo "Triplet Combination is Winner"  ;;
	${triplet[second_per]}) echo "Triplet Combination is Winner" ;;
	${triplet[third_per]}) echo "Triplet Combination is Winner" ;;
	${triplet[fourth_per]}) echo "Triplet Combination is Winner" ;;
	${triplet[fifth_per]}) echo "Triplet Combination is Winner" ;;
	${triplet[sixth_per]}) echo "Triplet Combination is Winner" ;;
	${triplet[seventh_per]}) echo "Triplet Combination is Winner" ;;
	${triplet[eigth_per]}) echo "Triplet Combination is Winner" ;;
esac
