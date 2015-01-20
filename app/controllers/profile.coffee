User = require 'zooniverse/models/user'
ZooProfile = require 'zooniverse/controllers/profile'

BaseController = require './base-controller'
Spinner = require '../lib/spin'

class Profile extends BaseController
  className: 'sub-page profile'
  template: require '../views/profile'

  elements:
    '#zooniverse-default-profile': 'zooniverseDefaultProfile'

  constructor: ->
    super

    @zooProfile ?= new ZooProfile
    @render()

    User.on 'change', @render
    User.on 'fetch', @onUserFetch

  render: =>
    @html @template
      user: User.current
      format: @formatNumber

    setTimeout =>
      @zooniverseDefaultProfile?.append @zooProfile.el

  active: =>
    super

  formatNumber: (n) ->
    return n unless n
    n.toString().replace /(\d)(?=(\d{3})+(?!\d))/g, '$1,'

module.exports = Profile
