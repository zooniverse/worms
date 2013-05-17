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
    $(e.currentTarget).addClass 'disabled'
    @favorite = new Favorite({subjects: [Subject.current]})
    @favorite.send()

  onDiscuss: =>
    window.location = Subject.current.talkHref()

  onFinish: =>
    Spine.trigger 'finished-classification'


module.exports = Actions