{ Tutorial, Step } = require 'zootorial'
t = require 't7e'

module.exports =
  welcome: new Step
    number: 1
    header: t 'span', 'tutorial.welcome.header'
    details: t 'span', 'tutorial.welcome.details'
    block: '.bubble'
    next: 'overview'
  
  overview: new Step
    number: 2
    header: t 'span', 'tutorial.overview.header'
    details: t 'span', 'tutorial.overview.details'
    block: '.bubble'
    next: 'begin'

  begin: new Step
    number: 3
    header: t 'span', 'tutorial.begin.header'
    details: t 'span', 'tutorial.begin.details'
    attachment: 'left 1.1 .bubble top left'
    focus: '.bubble'
    next: 'click .bubble': 'playing'

  playing: new Step
    number: 4
    header: t 'span', 'tutorial.playing.header'
    details: t 'span', 'tutorial.playing.details'
    attachment: 'left top .video-container right top'
    focus: '.video-container'
    onEnter: (tutorial) ->
      next = ->
        tutorial.load 'firstEggLaying'
      setTimeout next, 9400
    next: 'mouseup .no-exist': null # an impossible event

  firstEggLaying: new Step
    number: 5
    header: t 'span', 'tutorial.firstEggLaying.header'
    details: t 'span', 'tutorial.firstEggLaying.details'
    attachment: 'left top .video-container right top'
    focus: '.video-container'
    onEnter: (tutorial) ->
      $('.video-container').append('<div class="tutorial-circle"></div>')
      tutorial.video.video.pause()
    onExit: (tutorial) ->
      $('.tutorial-circle').remove()
      tutorial.video.video.play()
    next: 'eggsPlanation'

  eggsPlanation: new Step
    number: 6
    header: t 'span', 'tutorial.eggsPlanation.header'
    details: t 'span', 'tutorial.eggsPlanation.details'
    next: 'video'

  video: new Step
    number: 7
    header: t 'span', 'tutorial.video.header'
    details: t 'span', 'tutorial.video.details'
    next: 'finish'

  finish: new Step
    number: 8
    header: t 'span', 'tutorial.finish.header'
    details: t 'span', 'tutorial.finish.details'
