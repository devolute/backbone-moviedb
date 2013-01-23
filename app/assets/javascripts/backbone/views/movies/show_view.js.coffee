Moviedb.Views.Movies ||= {}

class Moviedb.Views.Movies.ShowView extends Backbone.View
  template: JST["backbone/templates/movies/show"]

  render: ->
    @$el.html(@template(@model.toJSON() ))
    return this
