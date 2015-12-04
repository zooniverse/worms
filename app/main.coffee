require './lib/setup'

if typeof console is 'undefined'
  @console =
    log: (message) ->
      # Do Nothing

Spine = require 'spine'

translate = require 't7e'
enUs = require './lib/en-us'
translate.load enUs

Api = require 'zooniverse/lib/api'
LanguageManager = require 'zooniverse/lib/language-manager'
Subject = require 'zooniverse/models/subject'
User = require 'zooniverse/models/user'
Footer = require 'zooniverse/controllers/footer'
TopBar = require 'zooniverse/controllers/top-bar'

api = if window.location.hostname is 'www.wormwatchlab.org'
  new zooniverse.Api project: 'worms', host: 'http://www.wormwatchlab.org', path: '/_ouroboros_api/proxy'
else
  new zooniverse.Api project: 'worms'

_V_.options.flash.swf = 'video/video-js.swf'

app = {}
app.container = '#app'

languageManager = new LanguageManager
  translations:
    en: label: 'English', strings: enUs
    de: label: "Deutsch", strings: "./translations/de.json"

languageManager.on 'change-language', (e, code, strings) ->
  translate.load strings
  translate.refresh()

app.navBar = new (require './controllers/nav-bar')
app.navBar.el.appendTo app.container

SubPage = require './controllers/sub-page'

app.stack = new Spine.Stack
  controllers:
    'home': require './controllers/home'
    'classifier': require './controllers/classifier'
    'about': class extends SubPage then content: require './views/pages/about'
    'team': class extends SubPage then content: require './views/pages/team'
    'partners': class extends SubPage then content: require './views/pages/partners'
    'profile': require './controllers/profile'

  routes:
    '/': 'home'
    '/classify': 'classifier'
    '/about': 'about'
    '/team': 'team'
    '/partners': 'partners'
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

new (require 'zooniverse/lib/google-analytics')
  account: 'UA-1224199-44'
  domain: 'wormwatchlab.org'
