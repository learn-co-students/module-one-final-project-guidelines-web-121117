require 'csv'
require 'json'
#
csv_credits = File.read('tmdb_5000_credits.csv')
csv_actors = CSV.parse(csv_credits, :headers => true)


csv_actors.map do |csv_file|
  movie_instance = Movie.find_or_create_by(name: csv_file.to_hash["title"]) #creates new movie
  actors = JSON.parse(csv_file.to_hash["cast"])[0..5].map {|actor| actor["name"]} #grabs first five actors names

  actors.each do |actor|
    new_actor = Actor.find_or_create_by(name: actor) #makes the actor
    movie_instance.actors << new_actor #adds each actor to the movie
  end

end

csv_movies = File.read('tmdb_5000_movies.csv')
csv_genres = CSV.parse(csv_movies, :headers => true)

genres = csv_genres[0].to_hash["genres"]
puts JSON.parse(genres).map {|genre_name| genre_name["name"]}


csv_genres.map do |csv_file|
  movie_instance = Movie.find_or_create_by(name: csv_file.to_hash["title"]) #finds the movie
  genres = JSON.parse(csv_file.to_hash["genres"].map {|genre_name| genre_name["name"]} #grabs the genres of movie

  genres.each do |genre|
    new_genre = Genre.find_or_create_by(name: genre) #find/create the genre
    movie_instance.genres << new_genre #adds each genre to the movie
  end

end
