class Moviedb.Models.User extends Backbone.Model

  paramRoot: 'user'
  
  url: 'users'
    
  defaults:
    "email" : ""
    "password" : ""
    "errors" : ""

  login: (callback) ->

    credentials =
      email: @get('email'),
      password: @get('password')

    @unset('password')
    @unset('id')

    that = this

    options =
      url: @urlFor('sign_in') 
      success: (data, response) ->
        console.log "sucessfull logged in"
        that.set('is_logged_in',true)
        callback()
      error: (data, response) ->
        callback(true, response)

    @save(credentials, options)

  logout: (callback) ->

    that = this
    options =
      dataType: "application/json"
      type: "DELETE"
      url: @urlFor('sign_out') 
      success: (data, response) ->
        that.set('is_logged_in',false)
        callback()
      error: (data, response) ->
        that.set('is_logged_in',false)
        callback(true, response)

    $.ajax options

  urlFor: (action) ->
    "#{@url}/#{action}.json"

  isLoggedIn: ->
    @get('is_logged_in')
