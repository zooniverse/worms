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
    attachment: 'left top video right top'
    focus: '.videoContainer'
    onEnter: (tutorial) ->
      next = ->
        tutorial.load 'firstEggLaying'
      setTimeout next, 13200
    next: 'mouseup .no-exist': null # an impossible event

  firstEggLaying: new Step
    number: 5
    header: 'Egg Layed'
    details: '''This is what an egg-laying event looks like. Look for these in the videos!
      If there are multiple eggs, please mark an event for each egg!
    '''
    attachment: 'left top video right top'
    focus: '.videoContainer'
    onEnter: (tutorial) ->
      fragment = document.createDocumentFragment()
      circleDiv = document.createElement 'div'
      circleDiv.classList.add 'tutorial-circle'

      fragment.appendChild circleDiv
      document.querySelector('.videoContainer').appendChild fragment

      tutorial.video.video.pause()
    onExit: (tutorial) ->
      circleDiv = document.querySelector '.tutorial-circle'
      circleDiv.parentNode.removeChild circleDiv
      tutorial.video.video.play()
    next: 'eggExplanation'

  eggExplanation: new Step
    number: 6
    header: 'Multiple Eggs'
    details: '''
      Sometimes there are multiple eggs. If you see more than one egg, press space for each egg.
    '''
    next: 'finish'

  finish: new Step
    number: 7
    header: 'Done!'
    details: 'That\'s it! Click "Finished" when the video is over to watch more worms!'




