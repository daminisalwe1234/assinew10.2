#!/bin/bash -x
declare -A singletResult
declare -A doubletResult
declare -A doubletWinPercentage

echo "Welcome to Flip Coin COmbination Shell program"
read -p "Enter 1 for Singlet 2 for Doublet :" operation
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
		for key in ${!doubletResult[@]}
		do
			doubletWinPercentage[$key]=`echo "scale=4; ${doubletResult[${key}]}*100/$numberOfFlips" | bc`
		done
	;;
	*)
		echo "INVALID INPUT"
	;;
esac
