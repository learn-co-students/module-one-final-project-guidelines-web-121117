require 'pry'

class CommandLineInterface

  def greet
    puts "Welcome to our Movie Info Database!"
  end

  def gets_user_input
    gets.chomp
  end

  def menu
    puts "Select an option to continue"
    puts "[1] Search by Movie Title"
    puts "[2] Search by Actor Name"
    puts "[3] Search by Genre Name"
    puts "[4] Close the Program"
    puts "Please enter a number 1-4:"
    input = gets.chomp
    case input
      when "1"
        movie_title_input
      when "2"
      when "3"
      when "4"
        exit
      else
        puts "That is not a valid option, Please try again."
        menu
    end
  end

  def exit
    puts "Goodbye"
  end

end



class MovieMethods

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
        input = check_case(gets.chomp)
        Movie.find_by(name: input)
      end
    end
  end

end
