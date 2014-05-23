Joi = require 'joi'

module.exports = (server) ->
  # site's main entry point
  server.route
    path: '/'
    method: 'GET'
    handler: (req, reply) ->
      server.methods.getTime req.query.hash || '', (err, time) ->
        reply 'Howdy ' + time

  server.route
    path: '/{path*}'
    method: '*'
    handler: (req, reply) ->
      reply('not found')
        .type('text/plain')
        .code(404)