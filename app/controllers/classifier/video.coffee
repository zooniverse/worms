Spine = require 'spine'

Subject = require 'zooniverse/models/subject'
User = require 'zooniverse/models/user'

Game = require '../../lib/game'

class Video extends Spine.Controller
  className: 'section video'
  template: require '../../views/classifier/video'

  elements:
    '.countdown': 'countdown'
    '.overlay': 'overlay'

  events:
    'click .countdown': 'onClickCountdown'

  constructor: ->
    super

    Spine.on 'startCountdown', @startCountdown
    Game.on 'start', @play

  render: =>
    @html @template
      subject: Subject.current

    if @video?.ready() then @video.dispose()

    @video = videojs 'worm-video', {}
    @video.off 'ended', @video.onEnded
    $('.vjs-controls').show()

  play: =>
    @video.play()

    @video.on 'play', =>
      Game.current.status = 'playing' # hack

    @video.on 'ended', =>
      @video.pause()
      Game.current.end()

  onClickCountdown: =>
    Spine.trigger 'startCountdown'

  startCountdown: =>
    unless Game.current.isStarting()
      Game.current.warmUp @video
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