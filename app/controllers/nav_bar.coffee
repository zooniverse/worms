class NavBarController extends Spine.Controller
  tag: 'header'

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

  render: =>
    @html require 'views/nav_bar'

module.exports = NavBarController