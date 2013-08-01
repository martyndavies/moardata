express = require 'express'
crypto  = require 'crypto'
flash   = require 'connect-flash'
path    = require 'path'
http    = require 'http'
stylus  = require 'stylus'
nib     = require 'nib'
db      = require 'mongoose'


db.connect process.env.MONGOHQ_URL
Item = db.model 'Item', { text: String, category: String }

app = express()

app.configure ->
  app.set "port", process.env.PORT or 3000
  app.set "views", __dirname + "/views"
  app.set "view engine", "jade"
  app.use express.cookieParser 'keyboard cat' 
  app.use express.session { key: 'bing', cookie: { maxAge: 60000 }}
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use flash()
  app.use app.router
  app.use stylus.middleware
    src: __dirname + '/assets'
    compile: (str, path) ->
      stylus(str).set('filename', path).set('compress', true).use(nib())
  app.use express.static(path.join(__dirname, "assets"))
  
app.configure 'development', () ->
  app.use express.errorHandler dumpExceptions: true, showStack: true
  
app.configure 'production', () ->
  app.use express.errorHandler()
  
app.get '/', (req, res) ->
  res.render 'index'

app.post '/add', (req, res) ->
  newItem = new Item { text: req.body.text, category: req.body.category }
  newItem.save (err) ->
    if err 
      res.send {saved:false}
    else
      res.send {saved: true}
  
http.createServer(app).listen app.get("port"), ->
  console.log "Express server listening on port " + app.get("port")