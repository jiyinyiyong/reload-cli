
log = console.log
show = require("util").print
{exec, spawn} = require \child_process
require! \fs

cli = process.argv[2 to]

# show cli
command = cli.0
paramater = cli[1 to]

runner = {}

do run = ->
  if runner?
    if runner.kill?
      runner.kill!

  log "\033[1;30mRestart...\033[0m"

  runner := spawn command, paramater

  runner
    ..stdout
      ..set-encoding \utf8
      ..on \data -> show it
  runner
    ..stderr
      ..set-encoding \utf8
      ..on \data -> show it

paramater.forEach ->
  if fs.exists-sync it
    stat = fs.stat-sync it
    unless stat.is-directory!
      fs.watch-file it, interval: 100, (curr, prev) ->
        do run