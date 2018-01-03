require 'pry'
require 'open-uri'

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
    puts ""
    puts "----->Main Menu<-----".colorize(:color=>:green, :mode=>:bold).center(40)
    puts ""
    puts "[1] ".colorize(:color=>:cyan, :mode=>:bold) + "Search by Movie Title"
    puts "[2] ".colorize(:color=>:cyan, :mode=>:bold) + "Search by Actor Name"
    puts "[3] ".colorize(:color=>:cyan, :mode=>:bold) + "See top 20 movies of any Genre"
    puts "[4] ".colorize(:color=>:cyan, :mode=>:bold) + "Close the Program"
    puts ""
    puts "Please enter a number 1-4:".colorize(:mode=>:bold)
    input = gets.chomp
    case input
      when "1"
        movie = movie_title_input
        movie_options(movie)
      when "2"
        actor = actor_name_input
        actor_options(actor)
      when "3"
        genre_options
      when "4"
        exit
      else
        puts ""
        puts "That is not a valid option, Please try again.".colorize(:color=>:light_red, :mode=>:bold)
        menu
    end
  end

  def exit
    goodbye = "G".colorize(:color=>:red, :mode=>:bold) + "o".colorize(:color=>:light_red, :mode=>:bold) + "o".colorize(:color=>:light_yellow, :mode=>:bold) + "d".colorize(:color=>:green, :mode=>:bold) + "b".colorize(:color=>:blue, :mode=>:bold) + "y".colorize(:color=>:magenta, :mode=>:bold) + "e".colorize(:color=>:light_magenta, :mode=>:bold)
    character = "(ﾉ◕ヮ◕)ﾉ*:･ﾟ".colorize(:color=>:blue) + "✧ ".colorize(:color=>:light_yellow)
    print character + " "
    print goodbye + " "
    print character + " "
    print goodbye + " "
    print character + " "
    print goodbye
    puts ""
    # url = 'https://www.youtube.com/watch?v=dQw4w9WgXcQ'
    # `open #{url}` #WARNING: DO NOT UNCOMMENT!!!
  end

end
