module MovieMethods

  def check_case(input)
    non_capitals = ["and", "the", "of", "in", "v"]
    input.split.map.with_index do |word, idx|
      idx != 0 && non_capitals.include?(word) ? word.downcase : word.capitalize
    end.join(" ")
  end

  def movie_title_input
    puts "Type in a movie to get started"
    input = check_case(gets.chomp)
    result = Movie.find_by(name: input)
    if result
      result
    else
      until Movie.find_by(name: input)
        puts "Could not find movie, Please enter a valid movie name:"
        input = check_case(gets.chomp)
        Movie.find_by(name: input)
      end
    end
  end

  def movie_options(movie)
    puts "You selected: #{movie.name}"
    puts "[1] View ratings"
    puts "[2] View actors"
    puts "[3] View genres"
    puts "[4] Return to main menu"
    input = gets.chomp
    case input
      when "1"
        movie_ratings(movie)
      when "2"
        movie_actors(movie)
      when "3"
        movie_genres(movie)
      when "4"
        new = CommandLineInterface.new
        new.menu
      else
        puts "Please enter a valid number between 1 and 4:"
        movie_options(movie)
    end

  end

  def movie_ratings(movie)
    puts "Average rating for #{movie.name}: #{Movie.find_by(name: movie.name).rating}"
  end

  def movie_actors(movie)
    puts Movie.find_by(name: movie.name).actors.map {|actor| actor.name}
  end

  def movie_genres(movie)
    genres = Movie.find_by(name: movie.name).genres.map {|genre| genre.name}.join(", ")
    puts "#{movie.name} has the following Genres: #{genres}"
  end



end
