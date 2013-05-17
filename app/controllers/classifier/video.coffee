Subject = require 'zooniverse/models/subject'
User = require 'zooniverse/models/user'

Game = require 'lib/game'

class Video extends Spine.Controller
  className: 'section video'
  template: require 'views/classifier/video'

  elements:
    '.countdown': 'countdown'
    '.overlay': 'overlay'

  constructor: ->
    super

    Subject.on 'select', @render

    Spine.on 'startCountdown', @startCountdown
    Spine.on 'finished-classification', @finish
      
    Game.on 'start', @play

  render: =>
    @html @template
      subject: Subject.current

    @video = _V_ 'worm-video', {}
    @video.removeEvent 'ended', @video.onEnded
    $('.vjs-controls').show()

  play: =>
    @video.play()
    @video.addEvent 'ended', =>
      @video.pause()

      @overlay.fadeIn()
      Game.current.end()

  finish: =>
    @video.destroy()

  startCountdown: =>
    setTimeout =>
      @countdown.show()
      @countdown.html("3")
    , 1000

    setTimeout =>
      @countdown.html("2")
    , 2000

    setTimeout =>
      @countdown.html("1")
    , 3000

    setTimeout =>
      @countdown.html("GO")
    , 4000

    setTimeout =>
      @countdown.remove()
      Game.current.start()
    , 5000


module.exports = Video