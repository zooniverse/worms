{Tutorial} = require 'zootorial'
{Step} = require 'zootorial'

module.exports =
  length: 3

  welcome: new Step
    number: 1
    header: 'Welcome to Worm Watch Lab!'
    details: 'Hello and welcome to the Worm Watch Lab. Here, you will help scientists determine when a worm lays an egg.'
    block: '.bubble'
    next: 'overview'
  
  overview: new Step
    number: 2
    header: 'The Task'
    details: 'All you have to do is press the space bar when you see a worm lay an egg. That\'s it!'
    block: '.bubble'
    next: 'begin'

  begin: new Step
    number: 3
    header: 'Let\'s begin...'
    details: 'Click this banner box to begin!'
    attachment: 'left bottom .bubble top left'
    focus: '.bubble'
    next: 'click .bubble': 'playing'

  playing: new Step
    number: 4
    header: 'Video Playing'
    details: 'The video is now playing. You can see the worm wiggling around a bit.'
    attachment: 'right top video bottom right'
    focus: '.classifier > .left'
    onEnter: (tutorial) ->
      next = ->
        tutorial.load 'firstEggLaying'
      setTimeout next, 12200
    next: 'mouseup .no-exist': null # an impossible event

  firstEggLaying: new Step
    number: 5
    header: 'Egg Layed'
    details: 'This is what an egg-laying event looks like. Look for these in the videos!'
    attachment: 'right top video bottom right'
    focus: '.classifier > .left'
    onEnter: (tutorial) ->
      tutorial.video.video.pause()
    onExit: (tutorial) ->
      tutorial.video.video.play()
    next: 'finish'

  finish: new Step
    number: 7
    header: 'Done!'
    details: 'That\'s it! Click "Finished" when the video is over to watch more worms!'
    next: 'click button[name="finish"]': null







