Moviedb.Views.Movies ||= {}

class Moviedb.Views.Movies.IndexView extends Backbone.View

  template: JST["backbone/templates/movies/index"]

  initialize: () ->
    @movies = @options.movies
    @movies.bind 'reset', @render

    Moviedb.data.user.on "change", @render, this
    Moviedb.data.filteredMovies = @filteredMovies = @movies.clone()

  render: =>
    @$el.html(@template())

    @facettesView = new Moviedb.Views.Movies.FacettesView(movies: @movies, el: @$("#facettes-view"))
    @facettesView.render()
    @tableView = new Moviedb.Views.Movies.TableView(movies: @filteredMovies, el: @$("#table-view"))
    @tableView.render()

    return this

