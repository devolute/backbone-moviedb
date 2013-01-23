class Moviedb.Views.StatusView extends Backbone.View

  initialize: ->
    @user = Moviedb.data.user
    @user.on 'change', @render, this
    @render()

  render: ->
    if Moviedb.data.user.isLoggedIn()
      @$el.html("Logged in as: #{@user.get('email')}  |  ")
      @$el.append("<a href='#logout'>Logout</a>")
    else
      @$el.html("<a href='#login'>Login</a>")

