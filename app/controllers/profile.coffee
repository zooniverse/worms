User = require 'zooniverse/models/user'
ZooProfile = require 'zooniverse/controllers/profile'

BaseController = require './base-controller'
Spinner = require '../lib/spin'

class Profile extends BaseController
  className: 'sub-page profile'
  template: require '../views/profile'

  elements:
    '#zooniverse-default-profile': 'zooniverseDefailtProfile'

  constructor: ->
    super

    @zooProfile ?= new ZooProfile
    @render()

    User.on 'change', @render

  render: =>
    @html @template
      user: User.current
      format: @formatNumber

    setTimeout =>
      @zooniverseDefailtProfile.append @zooProfile.el

  active: =>
    super
    @el.css 'opacity', '0.5'

    @loading = new Spinner().spin @el.get(0)

    User.fetch().done =>
      @el.css 'opacity', '1'
      @loading.stop()
      @render()

  formatNumber: (n) ->
    return n unless n
    n.toString().replace /(\d)(?=(\d{3})+(?!\d))/g, '$1,'

module.exports = Profile