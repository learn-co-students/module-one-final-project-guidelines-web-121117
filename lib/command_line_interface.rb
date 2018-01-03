require 'pry'

class CommandLineInterface
  include MovieMethods
  include ActorMethods
  include GenreMethods

  def greet
    puts "Welcome to our Movie Info Database!"
  end

  def gets_user_input
    gets.chomp
  end

  def menu
    puts "--->Main Menu<---"
    # puts "To Select: Enter by [number]"
    puts "[1] Search by Movie Title"
    puts "[2] Search by Actor Name"
    puts "[3] Search by Genre Name"
    puts "[4] Close the Program"
    puts "Please enter a number 1-4:"
    input = gets.chomp
    case input
      when "1"
        movie = movie_title_input
        movie_options(movie)
      when "2"
        actor = actor_name_input
        actor_options(actor)
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
