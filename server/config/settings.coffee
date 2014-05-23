settings =
  site:
    name: 'Hapi example app'

  server:
    env: process.env.NODE_ENV || 'development'
    port: process.env.PORT || 4000

module.exports = settings