Spine = require 'spine'

User = require 'zooniverse/models/user'

class NavBarController extends Spine.Controller
  className: 'header'
  template: require '../views/nav-bar'

  elements:
    'li': 'menuItems'

  events:
    'click .hamburger-menu': 'onClickHamburger'
    'click a': 'onChangePage'

  route: 'home'

  constructor: ->
    super

    @render()

    Spine.Route.bind 'change', (route) =>
      @route = route.path[1..-1] || @constructor::route
      @activateRoute()

    User.on 'change', @render

  render: =>
    @html @template
      user: User.current

    @activateRoute()

  activateRoute: =>
    @menuItems.removeClass 'active'
    $(".#{ @route }").addClass 'active'

  onClickHamburger: =>
    @menuItems.slideToggle(200)

  onChangePage: =>
    if window.innerWidth < 800
      @menuItems.slideUp(200)

module.exports = NavBarController
