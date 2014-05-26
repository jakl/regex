#!/usr/bin/env coffee

string = process.argv[2]
regex = process.argv[3]
flags = process.argv[4]

# console.log 'string: ' + string
# console.log 'regex: ' + regex
# console.log 'flags: ' + flags
console.log JSON.stringify string.match(new RegExp(regex, flags))
