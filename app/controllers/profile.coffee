User = require 'zooniverse/models/user'

BaseController = require 'controllers/base-controller'

class Profile extends BaseController
  className: 'sub-page profile'
  template: require 'views/profile'

  constructor: ->
    super

    @render()

    User.on 'change', @render

  render: =>
    @html @template
      user: User.current

module.exports = Profile