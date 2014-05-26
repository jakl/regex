#!/usr/bin/env coffee

http = require 'http'
exec = require('child_process').exec

http.createServer (req, res)->
  body = ''
  req.on 'data', (data)->
    body += data
  req.on 'end', ->
    data = try JSON.parse(body)
    compare data, (result)-> res.end(result)
.listen(8000)

compare = (args, cb)->
  if args?.string? and args.regex?
    flags = args.flags or ''
    exec "./regex.sh #{args.string} #{args.regex} #{flags}", (e, out)-> cb(out)
  else
    cb JSON.stringify
      error: 'Bad Options'
      example:
        string: 'match'
        regex: '[aC]'
        flags: 'ig'
