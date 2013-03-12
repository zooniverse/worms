require 'lib/setup'

ZooniverseBar = require 'zooniverse/lib/controllers/top_bar'
User = require 'zooniverse/lib/models/user'

Game = require 'models/Game'
Subject = require 'models/Subject'

HomeController = require('controllers/HomeController')
AboutController = require('controllers/AboutController')

PeerClassificationController = require("controllers/PeerClassificaitonController")
NavBar = require('controllers/NavBarController')
Api = require('zooniverse/lib/api')
Config = require('lib/config')


Api.init host: Config.apiHost

app = {}
app.container = '#app'

app.navBar = new NavBar
app.navBar.el.appendTo app.container

app.stack = new Spine.Stack
  controllers:
    'home': HomeController
    'peer': PeerClassificationController
    'about': AboutController  
  
  routes: 
    '/': 'home'
    '/classify': 'peer'
    '/about': 'about'

  default: 'home'

app.stack.el.appendTo app.container

app.topBar = new ZooniverseBar
  app: 'worms'
  appName:'Worms'
app.topBar.el.prependTo 'body'

Subject.getMore(2)
Subject.bind 'create', =>
  Game.setupGame()

Spine.Route.setup()

module.exports = app
    