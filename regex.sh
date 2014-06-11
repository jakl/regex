#!/usr/bin/env bash

# Tutorial: ./regex.sh MyString MyRegex MyOptionalRegexFlags
#   runs against the regex engines in javascript, ruby, and scala

die () {
    echo >&2 "$@"
    exit 1
}

prepend() {
  cat - "$1" > /tmp/chalkboard && mv /tmp/chalkboard "$1"
}

[ "$#" -gt 1 ] || die "./regex.sh string regex optional_flags"

string=$1
regex=$2
flags=$3

echo -n '{ "Javascript": '
./regex.coffee $string $regex $flags
echo -n ', "Ruby":       '
./regex.rb $string $regex $flags
echo -n ', "Scala":      '
./regex.scala $string $regex $flags 2>/dev/null
echo '}'
