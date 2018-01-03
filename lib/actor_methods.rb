module ActorMethods
  include MovieMethods

  def check_case(input)
    input.split.map { |word| word.capitalize }.join(" ")
  end

  def actor_name_input
    puts ""
    puts "Type in an actor's full name to get started".colorize(:mode=>:bold)
    input = check_case(gets.chomp)
    result = Actor.find_by(name: input)
    if result
      result
    else
      until Actor.find_by(name: input)
        puts ""
        puts "Could not find actor, Please enter a valid name:".colorize(:color=>:light_red, :mode=>:bold)
        input = check_case(gets.chomp)
        result = Actor.find_by(name: input)
      end
    end
    result
  end

  def actor_options(actor)
    puts ""
    puts "----->Actor Menu<-----".colorize(:color=>:green, :mode=>:bold).center(40)
    puts ""
    puts "You selected: ".colorize(:mode=>:bold) + "#{actor.name}".colorize(:color=>:green, :mode=>:bold)
    puts ""
    puts "[1] ".colorize(:color=>:cyan, :mode=>:bold) + "View actor's movies alphabetically" #fix the option
    puts "[2] ".colorize(:color=>:cyan, :mode=>:bold) + "View actor's movies by rating"
    puts "[3] ".colorize(:color=>:cyan, :mode=>:bold) + "Return to main menu"
    input = gets.chomp
    case input
      when "1"
        actor_movies(actor)
      when "2"
        actor_ratings(actor)
      when "3"
        new = CommandLineInterface.new
        new.menu
      else
        puts "Please enter a valid number between 1 and 3:".colorize(:color=>:light_red, :mode=>:bold)
        actor_options(actor)
    end
  end

  def actor_movies(actor)
    puts ""
    puts "Here is a list of #{actor.name}'s movies".colorize(:mode=>:bold)
    movies = actor.movies.map {|movie| movie.name}.sort
    movies_with_index = movies.map.with_index do |movie, idx|
      "[#{idx+1}] ".colorize(:color=>:cyan, :mode=>:bold) + "#{movie}"
    end
    puts movies_with_index
    puts ""
    puts "Select a movie to see its options".colorize(:mode=>:bold)
    input = gets.chomp
    return CommandLineInterface.new.exit if input == "exit"
    if input.to_i.between?(1, movies.count)
      movie_options(Movie.find_by(name: movies[input.to_i - 1]))
    else
      actor_movies(actor)
    end
  end

  def actor_ratings(actor)
    movies = actor.movies.map { |movie| "#{movie.rating}: #{movie.name}" }
    puts movies.sort.reverse
    actor_options(actor)
  end


end
