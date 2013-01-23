class Moviedb.Models.Session extends Backbone.Model

  initialize: (attr,options) ->
    @user = options.user

    @on 'destroy', @clear, this
    @on 'destroy', @user.reset, @user

  isLoggedIn: ->
    @get 'isLoggedIn'
