Moviedb.Views.Movies ||= {} 

class Moviedb.Views.Movies.ItemView extends Backbone.View

  tagName: 'li' 

  events:
    "click" : "select"

  initialize: ->
    @parent = @options.parent
    @type = @options.type

  select: ->
    @parent.trigger("item:selected", @options.value, @type)
    @selected = true
    @render()

  deselect: ->
    @selected = false
    @render()

  render: -> 
    content = "<a href='#'> #{@options.value} (#{@options.count})</a>"
    @$el.html(content)
    if @selected
      @$el.addClass("active")
    else
      @$el.removeClass("active")

    return this
