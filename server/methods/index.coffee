moment = require 'moment'

module.exports = (server) ->
  server.method 'getColor', (next) ->
    console.log 'getting that color'
    colors = ['red', 'blue', 'green', 'yellow']
    color = colors[Math.floor(Math.random() * colors.length)]
    next null, color

  server.method 'getTime', (query, next) ->
    time = moment().format('MMMM Do YYYY, h:mm:ss a')
    setTimeout ->
      next null, time
    , 2000
  , cache: expiresIn: 15000

