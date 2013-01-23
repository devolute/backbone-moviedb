Moviedb.Views.Movies ||= {}

class Moviedb.Views.Movies.RatingView extends Backbone.View

  tagName: 'select'
  maxRating: 5

  events:
    'change' : 'selectOption' 
    'click'  : 'click' 


  initialize: ->
    @rating = @options.rating

  click: (e) ->
    e.preventDefault()
    e.stopPropagation()

  selectOption: (e) ->
    e.preventDefault()
    e.stopPropagation()
    @trigger("selection:changed",@getSelected())

  getSelected: ->
    @$("option:selected").first().val()

  buildOptions: ->
    options = _.map _.range(@maxRating+1), (i) =>
      if !_.isUndefined(@rating) && @rating == i
        "<option selected='selected' value='#{i}'>#{i}</option>"
      else
        "<option value='#{i}'>#{i}</option>"

    options.join('\n')

  render: ->
    @$el.html(@buildOptions())
    return this
    

    



