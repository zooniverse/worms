require 'lib/setup'
Config = require 'lib/config'

Api = require 'zooniverse/lib/api'
Subject = require 'zooniverse/models/subject'
User = require 'zooniverse/models/user'
Footer = require 'zooniverse/controllers/footer'
TopBar = require 'zooniverse/controllers/top-bar'

NavBar = require 'controllers/NavBarController'
SubPage = require 'controllers/SubPage'

Home = require 'controllers/HomeController'
Classifier = require 'controllers/classifier'
Scene = require 'controllers/Scene'
Slider = require 'controllers/slider'

new Api project: 'worms', host: Config.apiHost

_V_.options.flash.swf = 'video/video-js.swf'

app = {}
app.container = '#app'

app.navBar = new NavBar
app.navBar.el.appendTo app.container

app.stack = new Spine.Stack
  controllers:
    'home': Slider
    'classifier': Classifier
    'science': class extends SubPage then content: require 'views/pages/science'
    'team': class extends SubPage then content: require 'views/pages/team'

  routes:
    '/': 'home'
    '/classify': 'classifier'
    '/science': 'science'
    '/team': 'team'

  default: 'home'

app.stack.el.appendTo app.container

app.footer = new Footer
app.footer.el.appendTo 'body > footer'

app.topBar = new TopBar
app.topBar.el.prependTo 'body'

Subject.queueLength = 1
Subject.next()

User.fetch()

Spine.Route.setup()

module.exports = app