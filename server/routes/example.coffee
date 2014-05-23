Joi = require 'joi'

module.exports = (server) ->
  # name param and query example stuff
  nameConfig =
    handler: (req, reply) ->
      names = req.params.name.split '/'
      reply
        first: names[0]
        last: names[1]
        mood: req.query.mood
    validate:
      params:
        name: Joi.string().min(4).max(100)
      query:
        mood: Joi.string().valid(['neutral', 'happy', 'sad']).default('neutral')

  server.route
    path: '/hello/{name*2}'
    method: 'GET'
    config: nameConfig

  # logging example
  server.route
    path: '/log/{data}'
    method: 'GET'
    handler: (req, reply) ->
      req.log ['pathData', 'request']
      reply 'logged ' + req.params.data
