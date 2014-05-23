Hapi = require 'hapi'
moment = require 'moment'
chalk = require 'chalk'
config = require('requirefrom')('/server/config')

server = new Hapi.Server '0.0.0.0', config('settings').server.port, config('hapi').options

require('./server/methods')(server)

# handle log events
server.on 'log', (event, tags) ->
  if tags.error
    console.error '[%s]: %s', chalk.white.bgRed(Object.keys(tags).join(' ')), event.data
  else
    console.log '[%s]: %s', chalk.cyan(Object.keys(tags).join(' ')), event.data

require('./server/routes')(server)

server.pack.require ['./plugins/example'], (err) ->
  throw err if err
  server.start ->
    console.log 'Hapi started in %s mode at %s', chalk.bold.yellow(config('settings').server.env), chalk.magenta(server.info.uri)