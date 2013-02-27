require('lib/setup')
Spine = require('spine')
Game  = require('models/Game')
User  = require('zooniverse/lib/models/user')

HomeController = require('controllers/HomeController')
AboutController = require('controllers/AboutController')


PeerClassificationController = require("controllers/PeerClassificaitonController")
NavBar = require('controllers/NavBarController')
ZooniverseBar = require('zooniverse/lib/controllers/top_bar')
Api = require('zooniverse/lib/api')
Config = require('lib/config')
Subject = require('models/Subject')

class Content extends Spine.Stack
  
  controllers:
    'peer' : PeerClassificationController
    'home' : HomeController
    'about': AboutController  
  
  routes: 
    '/classify' : 'peer'
    '/'         : 'home'
    '/about'    : 'about'

  default: 'home'


class App extends Spine.Controller
  constructor: ->
    super
    @append new NavBar()
    @append new Content()
    # @append require('views/footer')

    Api.init host: Config.apiHost

    Subject.getMore(2)
  
    Subject.bind 'create', =>
      Game.setupGame()

    topBar = new ZooniverseBar
      el: '.zooniverseTopBar'
      languages:
        en: 'English'
      app: 'worms'
      appName:'worms'

    Spine.Route.setup()

    # g  = new Game()

    # Game.current  = g
  
    # User.bind 'sign-in', =>
    #   g.requestJoin()

module.exports = App
    