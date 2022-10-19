#!/bin/bash
#rsOut=$(redshift -l 48.78:9.18 -p 2>&1)
#cTemp=$(echo $rsOut|awk -F'temperature: ' '{print $2}'|awk '{print $1}'|sed 's/K//')
#bNess=$(echo $rsOut|awk -F'Brightness: ' '{print $2}'|awk '{print $1}')

scriptDir=$(dirname "$0")
bNess=$(cat $scriptDir/.adjScreen_bNess.dat)
cTemp=$(cat $scriptDir/.adjScreen_cTemp.dat)
echo "$bNess $cTemp $1"

cNew=$cTemp;
bNew=$bNess;
if [ "$1" == "bUp" ]; then
    echo "bUp"
    bNew=$(echo "($bNess+0.1)*(($bNess+0.1)<=1) + 1*(($bNess+0.1)>1)"|bc)
elif [ "$1" == "bDown" ]; then
    echo "bDown"
    bNew=$(echo "($bNess-0.1)*(($bNess-0.1)>=0.1) + 0.1*(($bNess-0.1)<0.1)"|bc)
elif [ "$1" == "gUp" ]; then
    echo "gUp"
    cNew=$(echo "($cTemp+1000)*(($cTemp+1000)<=25000) + 1000*(($cTemp+1000)>25000)"|bc)
elif [ "$1" == "gDown" ]; then
    echo "gDown"
    cNew=$(echo "($cTemp-1000)*(($cTemp-1000)>=1000) + 1000*(($cTemp-1000)<1000)"|bc)
fi
echo $bNew > $scriptDir/.adjScreen_bNess.dat
echo $cNew > $scriptDir/.adjScreen_cTemp.dat
redshift -oP -O $cNew -b $bNew  
