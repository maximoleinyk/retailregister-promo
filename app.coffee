express = require('express')
bodyParser = require('body-parser')
cookieParser = require('cookie-parser')
handlebars = require('express-handlebars')
morgan = require('morgan')
errorhandler = require('errorhandler')

module.exports = (config) ->
  app = express()
  router = express.Router()

  hbs = handlebars.create
    layoutsDir: config.viewsDir
    extname: '.hbs'
    helpers:
      js: (path) ->
        "<script src=\"#{config.staticPath}/js/#{path}\"></script>"
      css: (path) ->
        "<link rel=\"stylesheet\" type=\"text/css\" href=\"#{config.staticPath}/css/#{path}\"/>"
    partialsDir: []

  app.engine 'hbs', hbs.engine
  app.set 'view engine', 'hbs'
  app.set 'views', config.viewsDir

  app.use config.staticPath, express.static(config.staticDir)
  app.use bodyParser.json()
  app.use cookieParser()
  app.use errorhandler()

  app.use morgan('combined')
  app.use router

  app.all '/robots.txt', (req, res) ->
    res.send('User-agent: *', {'Content-Type': 'text/plain'})

  app.all '/', (req, res) ->
    res.render('index')

  app.use (req, res) ->
    res.render('index')

  app.listen config.port, ->
    console.log('Running in ' + (process.env.NODE_ENV || 'development') + ' mode @ localhost:' + config.port)
