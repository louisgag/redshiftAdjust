#!/bin/bash
scriptDir=$(dirname "$0")
bNess=$(cat $scriptDir/.adjScreen_bNess.dat)
cTemp=$(cat $scriptDir/.adjScreen_cTemp.dat)

cNew=$cTemp;
bNew=$bNess;
if [ "$1" == "bUp" ]; then
    bNew=$(echo "($bNess+0.05)*(($bNess+0.05)<=1) + 1*(($bNess+0.05)>1)"|bc)
elif [ "$1" == "bDown" ]; then
    bNew=$(echo "($bNess-0.05)*(($bNess-0.05)>=0.1) + 0.1*(($bNess-0.05)<0.1)"|bc)
elif [ "$1" == "gUp" ]; then
    cNew=$(echo "($cTemp+250)*(($cTemp+250)<=25000) + 25000*(($cTemp+250)>25000)"|bc)
elif [ "$1" == "gDown" ]; then
    cNew=$(echo "($cTemp-250)*(($cTemp-250)>=1000) + 1000*(($cTemp-250)<1000)"|bc)
fi

echo $bNew > $scriptDir/.adjScreen_bNess.dat
echo $cNew > $scriptDir/.adjScreen_cTemp.dat
redshift -oP -O $cNew -b $bNew
