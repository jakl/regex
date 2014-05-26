#!/usr/bin/env bash

string=$1
regex=$2
flags=$3

echo -n '{ "Javascript": '
./regex.coffee $string $regex $flags
echo -n ', "Ruby":       '
./regex.rb $string $regex $flags
echo -n ', "Scala":      '
./regex.scala $string $regex $flags
echo '}'
