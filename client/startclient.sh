#!/bin/sh

PWD=`pwd`
numArms=$1
horizon=$2
hostname=$3
port=$4
randomSeed=$5
algorithm=$6
epsilon=$7
beta=$8
p=$9

#echo "Inside Client"

cmd="./bandit-agent --numArms $numArms --randomSeed $randomSeed --horizon $horizon --hostname $hostname --port $port --algorithm $algorithm --epsilon $epsilon --beta $beta --p $p"
#echo $cmd
$cmd
