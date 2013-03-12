require 'lib/setup'
Config = require 'lib/config'

Api = require 'zooniverse/lib/api'
TopBar = require 'zooniverse/controllers/top-bar'
Footer = require 'zooniverse/controllers/footer'

Game = require 'models/Game'
Subject = require 'models/Subject'

NavBar = require 'controllers/NavBarController'

HomeController = require 'controllers/HomeController'
AboutController = require 'controllers/AboutController'
PeerClassificationController = require 'controllers/PeerClassificaitonController'

new Api project: 'worms'

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

app.footer = new Footer
app.footer.el.appendTo 'body > footer'

app.topBar = new TopBar
app.topBar.el.prependTo 'body'

Subject.getMore(2)
Subject.bind 'create', =>
  Game.setupGame()

Spine.Route.setup()

module.exports = app
    