Subject = require 'zooniverse/models/subject'
User = require 'zooniverse/models/user'

Game = require 'lib/game'

class Stats extends Spine.Controller
  className: 'players'
  tag: 'section'
  template: require 'views/classifier/stats'

  elements:
    '.score': 'scoreBox'
    '.player1 .times': 'p1Times'
    '.player2 .times': 'p2Times'

  events:
    'click .sign-in': 'onClickSignIn'

  constructor: ->
    super
    
    @html @template()

    Subject.on 'select', =>
      @render()

    User.on 'change', (e, user) =>
      @render() if user

    Game.bind 'score', =>
      @score()

  render: =>
    @html @template
      game: Game.current
      user: User.current

  score: (data) =>
    @scoreBox.html "Score: #{ data.totalScore }"

    if data.otherPlayerTime
      @p2Times.append "<p class='time'> <span>Match at :</span> #{ data.otherPlayerTime / 1000 } s </p>"

  markEvent: (e) =>
    unless e.which is 32 then return

    e.preventDefault()

    if Game.current.status is 'playing'
      time = Game.current.markTime()
      @p1Times.prepend "<p class='time'> <span>Egg at :</span> #{ time } s</p>"

  onClickSignIn: =>
    require('zooniverse/controllers/login-dialog').show()


module.exports = Stats