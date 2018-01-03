module ActorMethods
  include MovieMethods

  def check_case(input)
    input.split.map { |word| word.capitalize }.join(" ")
  end

  def actor_name_input
    puts "Type in an actor's full name to get started"
    input = check_case(gets.chomp)
    result = Actor.find_by(name: input)
    if result
      result
    else
      until Actor.find_by(name: input)
        puts "Could not find actor, Please enter a valid name:"
        input = check_case(gets.chomp)
        Actor.find_by(name: input)
      end
    end
  end

  def actor_options(actor)
    puts "You selected: #{actor.name}"
    puts "[1] View actor's movies alphabetically" #fix the option
    puts "[2] View actor's movies by rating"
    puts "[3] Return to main menu"
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
        puts "Please enter a valid number between 1 and 3:"
        actor_options(actor)
    end
  end

  def actor_movies(actor)
    puts "Here is a list of #{actor.name}'s movies"
    movies = actor.movies.map {|movie| movie.name}.sort
    movies_with_index = movies.map.with_index do |movie, idx|
      "[#{idx+1}] #{movie}"
    end
    puts movies_with_index
    puts "Select a movie to see its options"
    input = gets.chomp.to_i
    if input.is_a?(Integer) && input.between?(1, movies.count)
      movie_options(Movie.find_by(name: movies[input -1]))
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
