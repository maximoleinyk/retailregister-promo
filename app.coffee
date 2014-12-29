express = require('express')
bodyParser = require('body-parser')
cookieParser = require('cookie-parser')
handlebars = require('express-handlebars')
morgan = require('morgan')

module.exports = (config) ->
  app = express()
  router = express.Router()

  hbs = handlebars.create
    layoutsDir: config.viewsDir
    defaultLayout: 'layout'
    extname: '.hbs'
    helpers: {}
    partialsDir: []

  app.engine 'hbs', hbs.engine
  app.set 'view engine', 'hbs'
  app.set 'views', config.viewsDir

  app.use bodyParser.json()
  app.use cookieParser()
  app.use express.static(config.staticDir)
  app.use morgan('combined')
  app.use router

  app.all '/robots.txt', (req, res) ->
    res.send('User-agent: *', {'Content-Type': 'text/plain'})

  app.all '/', (req, res) ->
    res.render('partials/header')

  app.listen config.port, ->
    console.log('Running in ' + (process.env.NODE_ENV || 'development') + ' mode @ localhost:' + config.port)
