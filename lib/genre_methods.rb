module GenreMethods
  include MovieMethods

  def check_case(input)
    input.split.map { |word| word.downcase == "tv" ? word.upcase : word.capitalize }.join(" ")
  end

  def genre_options
    puts ""
    puts "----->Genre Menu<-----".colorize(:color=>:green, :mode=>:bold)
    puts ""
    puts "Select one of the following options".colorize(:mode=>:bold)
    puts ""
    puts "[1] ".colorize(:color=>:cyan, :mode=>:bold) + "See a list of all genres"
    puts "[2] ".colorize(:color=>:cyan, :mode=>:bold) + "Return to main menu"
    input = gets.chomp
    case input
      when "1"
        genre_movies
      when "2"
        cli = CommandLineInterface.new
        cli.menu
      else
        puts "Please enter a valid number 1 or 2".colorize(:color=>:light_red, :mode=>:bold)
        genre_options
    end
  end

  def genre_movies
    puts ""
    puts "Select a genre to see its top 20 rated movies!".colorize(:mode=>:bold)
    puts ""
    puts Genre.all.map.with_index {|genre, idx| "[#{idx+1}] ".colorize(:color=>:cyan, :mode=>:bold) + "#{genre.name}"}

    input = gets.chomp.to_i
    if input.is_a?(Integer) && input.between?(1, 20)
      movies = Genre.all[input - 1].movies.sort_by {|movie| movie.rating}.reverse[0...20]
      puts "Top 20 #{Genre.all[input-1].name} Movies".colorize(:mode=>:bold)
      puts movies.map.with_index {|movie,idx| "[#{idx+1}] ".colorize(:color=>:cyan, :mode=>:bold) + "#{movie.name} " + "#{movie.rating}".colorize(:yellow)}
      genre_selection(movies)
    else
      puts "Please enter a valid number between 1 and 20".colorize(:color=>:light_red, :mode=>:bold)
      genre_movies
    end
  end

  def genre_selection(movies)
    puts ""
    puts "Select one of these movies to get more options".colorize(:mode=>:bold)
    puts ""
    input = gets.chomp.to_i
    if input.is_a?(Integer) && input.between?(1, 20)
      movie_options(movies[input-1])
    else
      puts "Please enter a valid number between 1 and 20".colorize(:color=>:light_red, :mode=>:bold)
      genre_selection(movies)
    end
  end

end
