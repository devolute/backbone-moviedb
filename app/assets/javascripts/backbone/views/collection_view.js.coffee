Moviedb.Views.Movies ||= {}

class Moviedb.Views.CollectionView extends Backbone.View

  tagName: 'ul'

  initialize: () ->
    @itemViews = @options.itemViews
    @title = @options.title
   
  render: =>
    @$el.empty()

    if @title
      @$el.append("<li class='nav-header'>#{@title}</li>")

    _.each(@itemViews, (view) => 
      @$el.append(view.render().el) 
    )
    this

