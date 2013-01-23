Moviedb.Views.Users ||= {}

class Moviedb.Views.Users.LoginView extends Backbone.View

  template: JST["backbone/templates/users/login"]

  events:
    "submit #login": "save"
    "click .close": "close"

  initialize: ->
    @model.on "change:errors", @render

  show: ->
    @$el.show()

  close: ->
    @$el.hide()
    window.router.navigate("/index",true)

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.login (err, response) => 
      console.log [err,response]
      if err
        @model.set 'errors', response
      else
        window.router.navigate("/index",true)
        @$el.hide()

  render: =>
    @$el.html(@template(@model.toJSON()))

    this.$("form").backboneLink(@model)

    return this
