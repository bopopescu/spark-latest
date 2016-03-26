#!/bin/bash

# Launch spark cluster

pemFile=$1
numberOfSlaves=$2
instanceType=$3
spotRequest=$4

key=`basename $pemFile .pem`

./spark-latest/ec2/spark-ec2 -k $key -i $pemFile -s $numberOfSlaves -r us-east-1 -t $instanceType --hadoop-major-version yarn -v 1.6.0 --spot-price $spotRequest --no-ganglia launch spark-$numberOfSlaves
