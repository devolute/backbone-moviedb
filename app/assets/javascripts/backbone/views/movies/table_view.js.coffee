Moviedb.Views.Movies ||= {}

class Moviedb.Views.Movies.TableView extends Backbone.View

  template: JST["backbone/templates/movies/table"]

  initialize: () ->
    @movies = @options.movies
    @movies.bind 'reset', @render 


  addAll: () =>
    @options.movies.each(@addOne)

  addOne: (movie) =>
    view = new Moviedb.Views.Movies.MovieView({model : movie})
    @$("tbody").append(view.render().el)

  render: =>
    @$el.html(@template())
    @addAll()

    this


