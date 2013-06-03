User = require 'zooniverse/models/user'

Game = require 'lib/game'

class Actions extends Spine.Controller
  className: 'section actions'
  template: require 'views/classifier/actions'

  events:
    'click .favorite': 'onFavorite'
    'click .discuss': 'onDiscuss'
    'click .finished': 'onFinish'

  constructor: ->
    super
    
    @html @template()

    User.on 'change', (e, user) =>
      @render() if user

    Game.on 'new end', @render

  render: =>
    @html @template
      user: User.current
      game: Game.current

  onFavorite: (e) =>
    return if e.currentTarget.classList.contains 'disabled'

    $(e.currentTarget).addClass 'disabled'
    @favorite = new Favorite({subjects: [Subject.current]})
    @favorite.send()

  onDiscuss: (e) =>
    return if e.currentTarget.classList.contains 'disabled'

    window.location = Subject.current.talkHref()

  onFinish: (e) =>
    return if e.currentTarget.classList.contains 'disabled'
      
    Spine.trigger 'finished-classification'


module.exports = Actions