#!/usr/bin/bash

echo "Enter Branch Name (Eg. Branch4)"
read branch
a=$(find /home -type f -path "*$branch/*" -name 'Daily_Interest_Rates.txt')
b=( "minor" "seniorCitizen" "foreigner" "resident" "citizen" "legacy")

minor=$(grep "minor" $a | awk '{print $2}' | tr -d %)
seniorCitizen=$(grep "seniorCitizen" $a | awk '{print $2}' | tr -d %)
foreigner=$(grep "foreigner" $a | awk '{print $2}' | tr -d %)
resident=$(grep "resident" $a | awk '{print $2}' | tr -d %)
citizen=$(grep "citizen" $a | awk '{print $2}' | tr -d %)
legacy=$(grep "legacy" $a | awk '{print $2}' | tr -d %)

details=($(find /home -type f -path "*$branch/*" -name 'ACC_Details.txt'))
balance=($(find /home -type f -path "*$branch/*" -name 'Current_Balance.txt'))
a1=$0
b1=$0
c1=$0
d1=$0
e1=$0
f1=$0

det=${#details[@]}
bal=${#balance[@]}
for (( c=0; c<$bal ; c++ ))
do
   amount[$c]=$(awk '{print $3}' ${balance[$c]} )
   echo "${amount[$c]}" 
done

for (( c=0 ; c<$det ; c++ ))
do
  if grep -q minor "${details[$c]}" || true 
    then a1=$(echo "${amount[$c]} * $minor" | bc)
    else al=$0
  fi
done

#sum=($(echo "a1 + b1 + c1 + d1 + e1 + f1" | bc))
#echo "${sum[1]}" 
