Spine = require('spine')

class NavBarController extends Spine.Controller
  className: 'navBar'

  constructor:->
    super 
    @render()
    
    Spine.Route.bind 'change', (route)=>
      route = route.path[1..-1]
      if route == ''
        route = "home"
      $(".nav li").removeClass("active")
      $(".#{route}").addClass("active")


  render :=>
    @html require('views/navBar')

module.exports = NavBarController