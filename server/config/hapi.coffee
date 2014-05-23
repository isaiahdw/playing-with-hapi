settings = require './settings'

hapi =
  development:
    options:
      cache:
        engine: 'catbox-memory'
      debug:
        request: ['received']
      plugins: ['lout']
  production:
    options:
      cache:
        engine: 'catbox-memory'

module.exports = hapi[settings.server.env]