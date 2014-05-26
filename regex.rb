#!/usr/bin/env ruby

require 'json'

string = ARGV[0] || ''
regex = ARGV[1] || ''
flags = ARGV[2] || ''

# puts 'string: ' + string
# puts 'regex: ' + regex
# puts 'flags: ' + flags

case_insensitive = flags.include?('i') ? true : false
result = if flags.include?('g')
    string.scan(Regexp.new(regex, case_insensitive)).to_json
  else
    [string.match(Regexp.new(regex, case_insensitive))].to_json
  end

# massage results to be like nodejs
result = 'null' if ['[]', '[null]'].include? result

puts result
