require 'csv'
require 'json'
#
# First seed
#
#
# csv_credits = File.read('tmdb_5000_credits.csv')
# csv_actors = CSV.parse(csv_credits, :headers => true)
#
#
# csv_actors.map do |csv_row|
#   movie_instance = Movie.find_or_create_by(name: csv_row["title"]) #creates new movie
#   actors = JSON.parse(csv_row["cast"])[0..5].map {|actor| actor["name"]} #grabs first five actors names
#
#   actors.each do |actor|
#     new_actor = Actor.find_or_create_by(name: actor) #makes the actor
#     movie_instance.actors << new_actor #adds each actor to the movie
#   end
# end
#
# csv_movies = File.read('tmdb_5000_movies.csv')
# csv_genres = CSV.parse(csv_movies, :headers => true)
#
# csv_genres.each do |csv_row|
#   movie_instance = Movie.find_or_create_by(name: csv_row["title"]) #finds the movie
#   genres = JSON.parse(csv_row["genres"]).map {|genre_name| genre_name["name"]} #grabs the genres of movie
#
#   genres.each do |genre|
#     new_genre = Genre.find_or_create_by(name: genre) #find/create the genre
#     movie_instance.genres << new_genre #adds each genre to the movie
#   end
#
# end
#
#
# Second Seed - add average rating
#
# csv_movies = File.read('tmdb_5000_movies.csv')
# csv_ratings = CSV.parse(csv_movies, :headers => true)
#
# csv_ratings.each do |csv_row|
#   movie = Movie.find_by(name: csv_row["title"])
#   new_rating = csv_row["vote_average"].to_f
#   movie.update(rating: new_rating)
# end

# Third seed - add rating count
#
# csv_movies = File.read('tmdb_5000_movies.csv')
# csv_rating_count = CSV.parse(csv_movies, :headers => true)
#
# csv_rating_count.each do |csv_row|
#   movie = Movie.find_by(name: csv_row["title"])
#   votes = csv_row["vote_count"].to_i
#   movie.update(rating_count: votes)
# end
