User = require 'zooniverse/models/user'

class NavBarController extends Spine.Controller
  className: 'header'
  template: require 'views/nav-bar'

  elements:
    'li': 'menuItems'

  route: 'home'

  constructor: ->
    super

    @render()

    Spine.Route.bind 'change', (route) =>
      @route = route.path[1..-1] || @constructor::route
      @activateRoute()

    User.on 'change', (e, user) =>
      if user then @render()

  render: =>
    @html @template
      user: User.current

    @activateRoute()

  activateRoute: =>
    @menuItems.removeClass 'active'
    $(".#{ @route }").addClass 'active'


module.exports = NavBarController