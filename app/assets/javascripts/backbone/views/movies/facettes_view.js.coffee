Moviedb.Views.Movies ||= {}

class Moviedb.Views.Movies.FacettesView extends Backbone.View

  initialize: () ->
    @movies = @options.movies
    @movies.bind('reset', @render)

    #
    # Event handlers
    @on 'item:selected', @filterMovies
   
  filterMovies: (value,type) ->
      
    @deselectItems()

    if value == "All"
      Moviedb.data.filteredMovies.reset @movies.models
    else
      value = null if value == "null"

      if(type == "average_rating")
        value = parseInt(value)

      filter = {}
      filter[type] = value

      filtered = @movies.where(filter)
      Moviedb.data.filteredMovies.reset filtered

  deselectItems: ->

    if @categoryItems
      _.each @categoryItems, (item) ->
        item.deselect()
    if @ratingItems
      _.each @ratingItems, (item) ->
        item.deselect()

  toSortedList: (facettes, key) ->
    key ||= 'count'
    facettes = _.map facettes, (v,k) ->
      count: v
      value: k
      
    # sort descending
    facettes = _.sortBy facettes, (item) -> 
      -item[key]

    facettes

  computeFacettes: (movies) ->
    categories =  _.countBy movies.toJSON(), (movie) ->
      movie.category

    categories["All"] = movies.length

    ratings = _.countBy movies.toJSON(), (movie) ->
      movie['average_rating']

    ratings["All"] = movies.length

    categories: @toSortedList(categories)
    ratings: @toSortedList(ratings,'value')

  buildItemViews: (items,options) ->

    _.map items, (item) =>
      params = {}
      _.each [options,item,parent:this], (obj) ->
        _.extend params, obj

      view = new Moviedb.Views.Movies.ItemView(params)

  render: =>
    facettes = @computeFacettes(@movies)

    @categoryItems ||= @buildItemViews(facettes.categories, type:"category")
    @ratingItems ||= @buildItemViews(facettes.ratings, type:"average_rating")

    categoriesView = new Moviedb.Views.CollectionView(
                                                id: "categories-facettes"
                                                title: "Categories"
                                                className: "nav nav-list"
                                                itemViews: @categoryItems)

    ratingsView = new Moviedb.Views.CollectionView(
                                                id: "ratings-facettes"
                                                title: "Ratings"
                                                className: "nav nav-list"
                                                itemViews: @ratingItems)

    console.log ratingsView

    @$el.append(categoriesView.render().el)
    @$el.append(ratingsView.render().el)
    
    return this
