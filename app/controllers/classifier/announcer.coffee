Spine = require 'spine'

Subject = require 'zooniverse/models/subject'
User = require 'zooniverse/models/user'

Game = require '../../lib/game'

class Announcer extends Spine.Controller
  className: 'section announcer'
  template: require '../../views/classifier/announcer'

  elements:
    '.message': 'message'

  events:
    'click .bubble': 'onClick'

  constructor: ->
    super
    
    @html @template()

    Subject.on 'select', =>
      @announce 'Click to start'

    Game.on 'score', (e, game, points) =>
      @announce "You matched #{ Game.current.otherPlayer } and earned #{ points } points!"

    Game.on 'remove-mark', (e, game, removedTime) =>
      @announce "You removed a mark at #{ removedTime.toFixed 2 }s"

    Game.on 'start', =>
      @announce 'Press "Z" if you see the worm lay an egg'

  render: =>
    @html @template
      game: Game.current

  announce: (message) =>
    @message.text message

  # Events
  onClick: (e) =>
    switch Game.current.status
      when 'waiting' then Game.current.start()
      when 'playing' then Game.current.markTime()
      when 'finished'
        if Game.current.pastBuffer() then Spine.trigger 'finished-classification'

module.exports = Announcer
