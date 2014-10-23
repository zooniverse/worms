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
    $('div.header').toggleClass 'add-margin'

  onChangePage: =>
    if window.innerWidth < 768
      @menuItems.slideUp(200)
      $('div.header').removeClass 'add-margin'

module.exports = NavBarController
