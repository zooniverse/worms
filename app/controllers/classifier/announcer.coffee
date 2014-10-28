Spine = require 'spine'
t = require 't7e'

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
      if window.innerWidth < 768
        @announce t 'span.middle-pos', 'classifyPage.messages.startPrompt.touch'
      else
        @announce t 'span.middle-pos', 'classifyPage.messages.startPrompt.desktop'

    Game.on 'score', (e, game, points) =>
      @announce "You matched #{ Game.current.otherPlayer } and earned #{ points } points!"

    Game.on 'remove-mark', (e, game, removedTime) =>
      @announce t 'span', 'classifyPage.messages.onRemoveMark', $time: "#{ removedTime.toFixed 2 }"

    Game.on 'start', =>
      if window.innerWidth < 768
        @announce t 'span', 'classifyPage.messages.onStart.touch'
      else
        @announce t 'span', 'classifyPage.messages.onStart.desktop'

  render: =>
    @html @template
      game: Game.current

  announce: (message) =>
    @message.html message

  # Events
  onClick: (e) =>
    switch Game.current.status
      when 'waiting' then Game.current.start()
      when 'playing' then Game.current.markTime()
      when 'finished'
        if Game.current.pastBuffer() then Spine.trigger 'finished-classification'

module.exports = Announcer
