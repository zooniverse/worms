require 'spine'
require 'spine/lib/manager'
require 'spine/lib/route'

Config = require 'lib/config'

Api = require 'zooniverse/lib/api'
Subject = require 'zooniverse/models/subject'
User = require 'zooniverse/models/user'
Footer = require 'zooniverse/controllers/footer'
TopBar = require 'zooniverse/controllers/top-bar'

NavBar = require 'controllers/nav_bar'
SubPage = require 'controllers/sub_page'

Classifier = require 'controllers/classifier'
Home = require 'controllers/home'

new Api project: 'worms', host: Config.apiHost

_V_.options.flash.swf = 'video/video-js.swf'

app = {}
app.container = '#app'

app.navBar = new NavBar
app.navBar.el.appendTo app.container

app.stack = new Spine.Stack
  controllers:
    'home': Home
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

User.fetch()

Spine.Route.setup()

module.exports = app