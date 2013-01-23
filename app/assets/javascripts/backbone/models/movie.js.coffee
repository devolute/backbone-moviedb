class Moviedb.Models.Movie extends Backbone.Model
  paramRoot: 'movie'

  defaults:
    title: null
    description: null
    category: null
    average_rating: null

  initialize: ->
    @on('change:my_rating', @updateRating, this)

  updateRating: ->

    data = {rate: @get('my_rating')}
    console.log data
    $.ajax
      type: "PUT"
      url: @url() + '/rate'
      data: data
      success: (data, response)->
        console.log response


class Moviedb.Collections.MoviesCollection extends Backbone.Collection
  model: Moviedb.Models.Movie
  url: '/movies'
