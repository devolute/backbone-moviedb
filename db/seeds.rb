# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
User.delete_all
User.create!(email: "movie@devolute.org", password: "movie123" )


[
  {title: "Fight Club", category: "Thriller", description: "How much can you know about yourself.."},
  {title: "The Matrix", category: "Sci-Fi", description: "How deep does the rabbit hole go"},
  {title: "Django Unchained", category: "Western", description: "The new Tarantino"},
  {title: "Pi", category: "Thriller", description: "Mathematics is the language of nature"},
  {title: "Departed", category: "Thriller", description: "Martin Scorsese"}
].each do |movie|
  Movie.create! movie
end
