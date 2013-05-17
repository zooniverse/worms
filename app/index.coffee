if typeof console is 'undefined'
  @console =
    log: (message) ->
      # Do Nothing

require 'spine'
require 'spine/lib/manager'
require 'spine/lib/route'

Api = require 'zooniverse/lib/api'
Subject = require 'zooniverse/models/subject'
User = require 'zooniverse/models/user'
Footer = require 'zooniverse/controllers/footer'
TopBar = require 'zooniverse/controllers/top-bar'

new Api project: 'worms', host: 'https://dev.zooniverse.org'

_V_.options.flash.swf = 'video/video-js.swf'

app = {}
app.container = '#app'

app.navBar = new (require 'controllers/nav-bar')
app.navBar.el.appendTo app.container

SubPage = require 'controllers/sub-page'

app.stack = new Spine.Stack
  controllers:
    'home': require 'controllers/home'
    'classifier': require 'controllers/classifier'
    'science': class extends SubPage then content: require 'views/pages/science'
    'team': class extends SubPage then content: require 'views/pages/team'
    'profile': require 'controllers/profile'

  routes:
    '/': 'home'
    '/classify': 'classifier'
    '/science': 'science'
    '/team': 'team'
    '/profile': 'profile'

  default: 'home'

app.stack.el.appendTo app.container

app.footer = new Footer
app.footer.el.appendTo 'body > .footer'

app.topBar = new TopBar
app.topBar.el.prependTo 'body'

Subject.queueLength = 1

User.fetch()

Spine.Route.setup()

module.exports = app