module MovieMethods

  def check_case(input)
    non_capitals = ["and", "the", "of", "in", "v"]
    input.split.map.with_index do |word, idx|
      idx != 0 && non_capitals.include?(word) ? word.downcase : word.capitalize
    end.join(" ")
  end

  def movie_title_input
    puts ""
    puts "Type in a movie title to get started".colorize(:mode=>:bold)
    input = check_case(gets.chomp)
    result = Movie.find_by(name: input)
    if result
      result
    else
      until Movie.find_by(name: input)
        puts "Could not find movie, Please enter a valid movie name:".colorize(:color=>:light_red, :mode=>:bold)
        input = check_case(gets.chomp)
        Movie.find_by(name: input)
      end
    end
  end

  def movie_options(movie)
    puts ""
    puts "----->Movie Menu<-----".colorize(:color=>:green, :mode=>:bold)
    puts ""
    puts "You selected: ".colorize(:mode=>:bold) + "#{movie.name}".colorize(:color=>:green, :mode=>:bold)
    puts ""
    puts "Average rating: ".colorize(:mode=>:bold) + "#{Movie.find_by(name: movie.name).rating}"
    movie_genres(movie)
    puts ""
    puts "[1] ".colorize(:color=>:cyan, :mode=>:bold) + "View top actors and select a movie"
    puts "[2] ".colorize(:color=>:cyan, :mode=>:bold) + "Return to main menu"
    input = gets.chomp
    case input
      when "1"
        movie_actors(movie)
      when "2"
        new = CommandLineInterface.new
        new.menu
      else
        puts "Please enter a valid number 1 or 2:".colorize(:color=>:light_red, :mode=>:bold)
        movie_options(movie)
    end

  end

  def movie_ratings(movie)
    puts ""

  end

  def movie_actors(movie)
    actors = Movie.find_by(name: movie.name).actors[0...5].map {|actor| actor.name}
    puts ""
    puts "#{movie.name} has the following top Actors: ".colorize(:mode=>:bold)
    puts actors.map.with_index {|actor,idx| "[#{idx+1}] ".colorize(:color=>:cyan, :mode=>:bold) + "#{actor}" }
    puts ""
    puts "Select an actor to get more information".colorize(:mode=>:bold)
    puts ""
    input = gets.chomp.to_i
    if input.is_a?(Integer) && input.between?(1,6)
      actor = Actor.find_by(name: actors[input-1])
      actor_options(actor)
    else
      puts "Please enter a valid number between 1 and 6:".colorize(:color=>:light_red, :mode=>:bold)
      movie_actors(movie)
    end

  end

  def movie_genres(movie)
    genres = Movie.find_by(name: movie.name).genres.map {|genre| genre.name}.join(", ")
    puts "Genres: ".colorize(:mode=>:bold) + "#{genres}"
  end



end
