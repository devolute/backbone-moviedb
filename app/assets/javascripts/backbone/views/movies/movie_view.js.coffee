Moviedb.Views.Movies ||= {}

class Moviedb.Views.Movies.MovieView extends Backbone.View
  template: JST["backbone/templates/movies/movie"]

  events:
    "click .destroy" : "destroy"
    "click" : "show"

  tagName: "tr"

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  show: () ->
    window.router.navigate("#{@model.id}",true)

  ratingChanged: (rating) ->
    console.log "@ratingChanged"
    @model.set('my_rating',rating)

  render: ->
    @$el.html(@template(@model.toJSON() ))
    if Moviedb.data.user.isLoggedIn()
      rating = @model.get('my_rating')
      console.log rating
      ratingView = new Moviedb.Views.Movies.RatingView({rating:rating})
      ratingView.on "selection:changed", @ratingChanged, this

      @$('.my-rating').html(ratingView.render().el)

    return this
