Moviedb.Views.Movies ||= {}

class Moviedb.Views.Movies.CategoryItemView extends Backbone.View

  tagName: 'li' 
  className: 'category-item'

  events:
    "click" : "select"

  initialize: ->
    @parent = @options.parent

  select: ->
    @parent.trigger("category:selected", @options.category, this)
    @selected = true
    @render()

  deselect: ->
    @selected = false
    @render()

  render: -> 
    content = "<a href='#'> #{@options.category} (#{@options.count})</a>"
    @$el.html(content)
    if @selected
      @$el.addClass("active")
    else
      @$el.removeClass("active")

    return this
