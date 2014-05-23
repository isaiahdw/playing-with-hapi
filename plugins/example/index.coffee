internals = {}

exports.register = (plugin, options, next) ->
  plugin.route
    path: '/example'
    method: 'GET'
    handler: (req, res) ->
      res('This is a reply from the example plugin route')
      .type('text/plain')
      .code(418)

  next()