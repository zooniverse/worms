Spine = require 'spine'

Subject = require 'zooniverse/models/subject'
User = require 'zooniverse/models/user'

Game = require '../../lib/game'

class Video extends Spine.Controller
  className: 'section video'
  template: require '../../views/classifier/video'

  elements:
    '.overlay': 'overlay'

  events:
    'click .overlay': 'onClickOverlay'

  constructor: ->
    super

    Game.on 'start', @play

  render: =>
    @html @template
      subject: Subject.current

    if @video?.ready() then @video.dispose()

    @video = videojs 'worm-video', {}

    @video.off 'ended', @video.onEnded
    $('.vjs-controls').show()

  play: =>
    @overlay.hide()

    Game.current.video = @video

    @video.play()

    @video.on 'play', =>
      Game.current.status = 'playing' # hack

    @video.on 'ended', =>
      @video.pause()
      Game.current.end()

  onClickOverlay: =>
    Game.current.start()

module.exports = Video
