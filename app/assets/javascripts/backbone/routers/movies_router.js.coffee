class Moviedb.Routers.MoviesRouter extends Backbone.Router
  initialize: (options) ->
    @movies = new Moviedb.Collections.MoviesCollection()
    @movies.reset options.movies

    if options.user
      options.user["is_logged_in"] = true
    @user = Moviedb.data.user = new Moviedb.Models.User(options.user)
    
    console.log $("#status")
    @statusView = new Moviedb.Views.StatusView(el:$("#status"))

  routes:
    "new"      : "newMovie"
    "index"    : "index"
    "login"    : "login"
    "logout"    : "logout"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"       : "index"

  newMovie: ->
    @view = new Moviedb.Views.Movies.NewView(collection: @movies)
    $("#movies").html(@view.render().el)

  index: ->
    @view = new Moviedb.Views.Movies.IndexView(movies: @movies)
    $("#movies").html(@view.render().el)

  show: (id) ->
    movie = @movies.get(id)

    @view = new Moviedb.Views.Movies.ShowView(model: movie)
    $("#movies").html(@view.render().el)

  edit: (id) ->
    if Moviedb.data.user.isLoggedIn()
      movie = @movies.get(id)

      @view = new Moviedb.Views.Movies.EditView(model: movie)
      $("#movies").html(@view.render().el)
    else
      @navigate('/index',true)

  login: ->
    unless @loginView
      @loginView = new Moviedb.Views.Users.LoginView(model: @user)
      $("body").append(@loginView.render().el)

    @loginView.show()

  logout: ->
    @user.logout ->
      console.log "Logged Out"
    @navigate('/index',true)
