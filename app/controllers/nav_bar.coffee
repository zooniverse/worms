User = require 'zooniverse/models/user'

class NavBarController extends Spine.Controller
  className: 'header'

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
    @html require('views/nav_bar')
      user: User.current

module.exports = NavBarController