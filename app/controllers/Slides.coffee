
class BaseSlide extends Spine.Controller
  section: {}

  constructor: ({el: @section}) ->
    throw 'needs section' unless @section
    super

  enter: =>
    @section.show()

  exit: (cb) =>
    @section.hide 0, =>
      cb()

class Slide1 extends BaseSlide

  elements:
    '.details': 'details'
    '.person': 'person'

  enter: =>
    @person.animate
      opacity: 1
    @section.fadeIn()

  exit: (cb) =>
    @person.animate
      opacity: 0
    , 300

    reset = =>
      @section.hide()

    @delay cb, 300
    @delay reset, 301


class Slide2 extends BaseSlide

  elements:
    '.details': 'details'
    '.right': 'right'
    '.worm': 'worm'

  constructor: (opts) ->
    super(opts)

    @worm.css
      opacity: 0

  enter: =>
    @worm.animate
      opacity: 1

    super

  exit: (cb) =>
    @right.fadeOut()
    @worm.animate
      opacity: 0
      , 300

    reset = =>
      @section.hide()
      @worm.css
        opacity: 0

    @delay cb, 300
    @delay reset, 301


class Slide3 extends BaseSlide

  elements:
    '.genes': 'genes'

  enter: =>
    @section.show()
    @animateTo = (@el.innerWidth() / 2) - (@genes.width() / 2)
    @genes.animate {left: @animateTo}



class Slide4 extends BaseSlide


module.exports = [Slide1, Slide2, Slide3, Slide4]