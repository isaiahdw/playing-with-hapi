module.exports = (server) ->
  # static content
  server.route
    path: '/public/{path*}'
    method: 'GET'
    handler:
      directory:
        path: 'public'
