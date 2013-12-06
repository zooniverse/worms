{ Tutorial, Step } = require 'zootorial'

module.exports =
  welcome: new Step
    number: 1
    header: 'Welcome to the Worm Watch Lab tutorial!'
    details: '''Your job is to watch a short video and watch out for when a worm lays an egg. In this tutorial
      we\'re going to show you an example of this happening.'''
    block: '.bubble'
    next: 'overview'
  
  overview: new Step
    number: 2
    header: 'The Task'
    details: 'All you have to do is tap the "Z" key on your computer when you see a worm lay an egg. That\'s it!'
    block: '.bubble'
    next: 'begin'

  begin: new Step
    number: 3
    header: 'Let\'s begin...'
    details: 'Click the banner box below to begin!'
    attachment: 'left 1.1 .bubble top left'
    focus: '.bubble'
    next: 'click .bubble': 'playing'

  playing: new Step
    number: 4
    header: 'Video Playing'
    details: 'The video is now playing. You can see the worm wiggling around a bit.'
    attachment: 'left top .video-container right top'
    focus: '.video-container'
    onEnter: (tutorial) ->
      next = ->
        tutorial.load 'firstEggLaying'
      setTimeout next, 9400
    next: 'mouseup .no-exist': null # an impossible event

  firstEggLaying: new Step
    number: 5
    header: 'Egg Layed'
    details: '''This is what an egg-laying event looks like. It appears as a small bulge from
      the middle of a worm.<br><br>

      The eggs will only ever appear from the middle of a worm near the red dot.<br><br>

      If there are multiple eggs, please mark an event (using the "Z" key) for each egg.
    '''
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
    header: 'Egg Marking'
    details: '''
      Sometimes there are multiple eggs. If you see more than one egg, press the "Z" key for each egg.<br><br>

      You will occasionally see videos where some eggs have been laid before the video starts.
      You don't have to mark these!
    '''
    next: 'video'

  video: new Step
    number: 7
    header: 'Video Controls'
    details: '''
      Click the video to start/stop it at any time. Control the time of the video by
      clicking on the progress bar.<br><br>

      You can remove a mark by clicking the little "x" next to the marked time on
      the right.<br><br>
    '''
    next: 'finish'

  finish: new Step
    number: 8
    header: 'Done!'
    details: 'That\'s it! Click "Finished" when the video is over to watch more worms!'
