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


