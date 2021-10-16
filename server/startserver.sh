#!/bin/sh

numArms=$1
horizon=$2
port=$3
banditFile=$4
randomSeed=$5
banditDist=$6
outputFile=$7

# echo "Inside Server"

cmd="./bandit-environment --numArms $numArms --randomSeed $randomSeed --horizon $horizon --banditFile $banditFile --port $port --banditDist $banditDist"
# echo $cmd
$cmd > $outputFile &
# $cmd > $outputFile
