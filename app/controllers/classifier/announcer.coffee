Subject = require 'zooniverse/models/subject'
User = require 'zooniverse/models/user'

Game = require 'lib/game'

class Announcer extends Spine.Controller
  className: 'announcer'
  tag: 'section'
  template: require 'views/classifier/announcer'

  elements:
    '.message': 'message'

  events:
    'click .bubble': 'onClick'

  constructor: ->
    super
    
    @html @template()

    Subject.on 'select', =>
      @render()

    Game.bind 'score', (data) =>
      @annouce "You matched with #{Game.current.otherPlayer} and earned #{data.points}!"

    Game.on 'start', =>
      @render()

  render: =>
    @html @template
      game: Game.current

  announce: (message) =>
    @message.text message


  # Events
  onClick: (e) =>
    # if Game.current.status is 'waiting' then Game.current.start()
    if Game.current.status is 'waiting' then Spine.trigger 'startCountdown'


module.exports = Announcer