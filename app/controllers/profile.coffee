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

  active: =>
    super
    @el.css 'opacity', '0.5'

    @loading = new Spinner().spin @el.get(0)

    User.fetch().done =>
      @el.css 'opacity', '1'
      @loading.stop()
      @render()

module.exports = Profile