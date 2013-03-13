require 'lib/setup'
Config = require 'lib/config'

Footer = require 'zooniverse/controllers/footer'
TopBar = require 'zooniverse/controllers/top-bar'
Api = require 'zooniverse/lib/api'
Subject = require 'zooniverse/models/subject'

Game = require 'models/Game'

NavBar = require 'controllers/NavBarController'

Home = require 'controllers/HomeController'
About = require 'controllers/AboutController'
Classifier = require 'controllers/PeerClassificaitonController'

new Api project: 'worms'

app = {}
app.container = '#app'

app.navBar = new NavBar
app.navBar.el.appendTo app.container

app.stack = new Spine.Stack
  controllers:
    'home': Home
    'classifier': Classifier
    'about': About
  
  routes:
    '/': 'home'
    '/classify': 'classifier'
    '/about': 'about'

  default: 'home'

app.stack.el.appendTo app.container

app.footer = new Footer
app.footer.el.appendTo 'body > footer'

app.topBar = new TopBar
app.topBar.el.prependTo 'body'

Subject.queueLength = 1
Subject.next()
Spine.Route.setup()

module.exports = app