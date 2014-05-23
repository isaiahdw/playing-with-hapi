path = require 'path'
glob = require 'glob'

module.exports = (server) ->
  routes = glob.sync '*',
    cwd: __dirname

  routes.forEach (route) ->
    route = path.basename(route, path.extname(route))
    if route != 'index'
      require(path.join(__dirname, route))(server)
