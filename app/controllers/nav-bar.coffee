User = require 'zooniverse/models/user'

class NavBarController extends Spine.Controller
  className: 'header'
  template: require 'views/nav-bar'

  elements:
    'li': 'menuItems'

  constructor: ->
    super 
    @render()
    
    Spine.Route.bind 'change', (route) =>
      route = route.path[1..-1]
      unless route then route = 'home'
      @menuItems.removeClass 'active'
      $(".#{route}").addClass 'active'

    User.on 'change', (e, user) =>
      if user then @render()

  render: =>
    @html @template
      user: User.current

module.exports = NavBarController