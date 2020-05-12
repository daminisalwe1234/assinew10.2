#!/bin/bash -x
declare -A singletResult
declare -A doubletResult
declare -A doubletWinPercentage
declare -A tripletResult
declare -A tripletWinPercentage
echo "Welcome to Flip Coin COmbination Shell program"
read -p "Enter 1 for Singlet 2 for Doublet 3 for Triplet :" operation
case $operation in
	1)
		read -p "Enter the number of times to flip coin :" numberOfFlips
		singletResult[heads]=0
		singletResult[tails]=0
		for ((counter=1;counter<=numberOfFlips;counter++))
		do
			#generating output of heads or tails using RANDOM 1 means heads and 0 means tails
			randomResult=$((RANDOM%2))
			if [ $randomResult -eq 1 ]
			then
				((singletResult[heads]++))
			else
				((singletResult[tails]++))
			fi
		done
		percentHeads=`echo "scale=4 ; ${singletResult[heads]}*100/$numberOfFlips" | bc`
		percentTails=`echo "scale=4 ; ${singletResult[tails]}*100/$numberOfFlips" | bc`
		winningcount=0
		for key in ${!singletResult[@]}
		do
			if [ $winningcount -lt ${singletResult[${key}]} ]
			then
				winningCombination=$key
			fi
		done
		echo "Winning combination is $winningCombination"
	;;
	2)
		read -p "Enter the number of times to flip coin :" numberOfFlips
		doubletResult[HH]=0
		doubletResult[HT]=0
		doubletResult[TH]=0
		doubletResult[TT]=0
		for ((counter=1;counter<=numberOfFlips;counter++))
		do
			#generating output of Doublet combinations using RANDOM 3 means HH ,2 means HT,1 means TH,0 means TT
			randomResult=$((RANDOM%4))
			if [ $randomResult -eq 3 ]
			then
				((doubletResult[HH]++))
			elif [ $randomResult -eq 2 ]
			then
				((doubletResult[HT]++))
			elif [ $randomResult -eq 1 ]
			then
				((doubletResult[TH]++))
			else
				((doubletResult[TT]++))
			fi
		done
		#Calculation of percentage wins of each doublet combination and storing them accordingly
		for key in ${!doubletResult[@]}
		do
			doubletWinPercentage[$key]=`echo "scale=4; ${doubletResult[${key}]}*100/$numberOfFlips" | bc`
		done
		#finding the maximum win percent combination and displaying it with the win percentage
		winningPercent=0
		for key in ${!doubletWinPercentage[@]}
		do
			if (( $(echo "$winningPercent < ${doubletWinPercentage[${key}]}" | bc -l) ))
			then
				winningPercent=${doubletWinPercentage[${key}]}
				winningCombination=$key
			fi
		done
		echo "Winning combination is $winningCombination with win percentage of $winningPercent"
	;;
	3)
		read -p "Enter the number of times to flip coin :" numberOfFlips
		tripletResult[HHH]=0
		tripletResult[HHT]=0
		tripletResult[HTH]=0
		tripletResult[HTT]=0
		tripletResult[THH]=0
		tripletResult[THT]=0
		tripletResult[TTH]=0
		tripletResult[TTT]=0
		for((counter=1;counter<=numberOfFlips;counter++))
		do
			#generating output of Triplet combinations using RANDOM 7 means HHH ,6 means HHT,5 means HTH,4 means HTT,3 means THH,2 means THT,1 means TTH,0 means TTT
                	randomResult=$((RANDOM%8))
			case "$randomResult" in
				7)
					((tripletResult[HHH]++))
				;;
				6)
					((tripletResult[HHT]++))
				;;
				5)
					((tripletResult[HTH]++))
				;;
				4)
					((tripletResult[HTT]++))
				;;
				3)
					((tripletResult[THH]++))
				;;
				2)
					((tripletResult[THT]++))
				;;
				1)
					((tripletResult[TTH]++))
				;;
				*)
					((tripletResult[TTT]++))
				;;

			esac
		done
		#Calculation of percentage wins of each triplet combination and storing them accordingly
		for key in ${!tripletResult[@]}
		do
			tripletWinPercentage[$key]=`echo "scale=4 ; ${tripletResult[${key}]}*100/$numberOfFlips" | bc`
		done
		#finding the maximum win percent combination and displaying it with the win percentage
		winningPercent=0
		for key in ${!tripletWinPercentage[@]}
		do
			if (( $(echo "$winningPercent < ${tripletWinPercentage[${key}]}" | bc -l) ))
			then
				winningPercent=${tripletWinPercentage[${key}]}
				winningCombination=$key
			fi
		done
		echo "Winning combination is $winningCombination with win percentage of $winningPercent"

	;;
	*)
		echo "INVALID INPUT"
	;;
esac

