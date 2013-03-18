require 'lib/setup'
Config = require 'lib/config'

Api = require 'zooniverse/lib/api'
Subject = require 'zooniverse/models/subject'
Footer = require 'zooniverse/controllers/footer'
TopBar = require 'zooniverse/controllers/top-bar'

NavBar = require 'controllers/NavBarController'
SubPage = require 'controllers/SubPage'

Home = require 'controllers/HomeController'
Classifier = require 'controllers/PeerClassificaitonController'
Scene = require 'controllers/Scene'

new Api project: 'worms'
_V_.options.flash.swf = 'video/video-js.swf'

app = {}
app.container = '#app'

app.navBar = new NavBar
app.navBar.el.appendTo app.container

app.stack = new Spine.Stack
  controllers:
    'home': Scene
    'classifier': Classifier
    'about': class extends SubPage then content: require 'views/pages/about'
  
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