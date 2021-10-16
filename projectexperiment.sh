#!/bin/bash

PWD=`pwd`
nRuns=100
hostname="localhost"
port=5001
epsilon=0.0

banditDist="beta"
# Allowed values for bandit distribution(case-sensitive)
# 1. beta

horizon=10
# horizon=100
# horizon=1000
# horizon=10000
# horizon=100000

# algorithm="BETA-UCB"
# algorithm="ADAPTIVE-BETA-UCB"
# algorithm="UCB-TUNED"
algorithm="UCB"
# algorithm="KL-UCB"
# Allowed values for algorithm parameter(case-sensitive)
# 1. BETA-UCB
# 2. ADAPTIVE-BETA-UCB
# 3. UCB-TUNED
# 4. UCB
# 5. KL-UCB

beta=0.5
p=3

# numArms=2
# numArms=5
# numArms=10
numArms=25
# numArms=50
# deviation=0.01
# deviation=0.05
# deviation=0.1
deviation=0.18
# deviation=0.28
filen="N"$numArms"_Dev"$deviation".txt"
banditFile=$PWD/data/$filen

SERVERDIR=./server
CLIENTDIR=./client

direcname="output_"$numArms"_"$deviation"_"$horizon
OUTPUTDIR=$PWD/results/$direcname
mkdir $OUTPUTDIR

for i in $(seq 1 $nRuns); do
	randomSeed=$((i-1))
	# OUTPUTFILE=$PWD/results/output_$numArms_$deviation_$horizon/serverlog.$algorithm.$randomSeed
	OUTPUTFILE=$OUTPUTDIR/serverlog.$algorithm.$randomSeed

	pushd $SERVERDIR
	cmd="./startserver.sh $numArms $horizon $port $banditFile $randomSeed $banditDist $OUTPUTFILE &"
	#echo $cmd
	$cmd 
	popd

	sleep 1

	pushd $CLIENTDIR
	cmd="./startclient.sh $numArms $horizon $hostname $port $randomSeed $algorithm $epsilon $beta $p &"
	#echo $cmd
	$cmd > /dev/null 
	popd
done

OUTPUTDIRAVERAGE=$PWD/results/$direcname/average
mkdir $OUTPUTDIRAVERAGE
OUTPUTFILETEMPLATE=$PWD/results/$direcname/serverlog.$algorithm
SAVEINGAVERAGE=$OUTPUTDIRAVERAGE/serverlog.$algorithm
cmd="$(awk '{a[FNR]+=$1;b[FNR]++;}END{for(i=1;i<=FNR;i++)print a[i]/b[i];}' $OUTPUTFILETEMPLATE.*  > $SAVEINGAVERAGE'_output')"
# echo "${cmd}"
$cmd