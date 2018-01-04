require 'pry'
require 'open-uri'

class CommandLineInterface
  include MovieMethods
  include ActorMethods
  include GenreMethods
  include HelperMethods

  def greet
    puts "Welcome to our Movie Info Database!"
  end

  def main_menu
    puts ""
    puts "----->Main Menu<-----".colorize(:color=>:green, :mode=>:bold).center(40)
    puts ""
    puts "[1] ".colorize(:color=>:cyan, :mode=>:bold) + "Search by Movie Title"
    puts "[2] ".colorize(:color=>:cyan, :mode=>:bold) + "Search by Actor Name"
    puts "[3] ".colorize(:color=>:cyan, :mode=>:bold) + "See top 20 movies of any Genre"
    puts "[4] ".colorize(:color=>:cyan, :mode=>:bold) + "Google Search any Movie"
    puts "[5] ".colorize(:color=>:cyan, :mode=>:bold) + "Play Movie Hangman"
    puts "[6] ".colorize(:color=>:cyan, :mode=>:bold) + "Close the Program"
    puts ""
    puts "Please enter a number 1-6:".colorize(:mode=>:bold)
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
        annoying_google
      when "5"
        Hangman.new.run
      when "6"
        exit
      else
        puts ""
        puts "That is not a valid option, Please try again.".colorize(:color=>:light_red, :mode=>:bold)
        main_menu
    end
  end

  def annoying_google
    puts "What would you like to google?"
    input = gets.chomp
    input = input.split.join("+")
    url = "http://lmgtfy.com/?q=#{input}"
    `open #{url}`
    character = "(๑˃ᴗ˂)ﻭ ".colorize(:magenta)
    puts ""
    3.times {print character}
    puts ""
    main_menu
  end

  def exit
    goodbye = "G".colorize(:color=>:red, :mode=>:bold) + "o".colorize(:color=>:light_red, :mode=>:bold) + "o".colorize(:color=>:light_yellow, :mode=>:bold) + "d".colorize(:color=>:green, :mode=>:bold) + "b".colorize(:color=>:blue, :mode=>:bold) + "y".colorize(:color=>:magenta, :mode=>:bold) + "e".colorize(:color=>:light_magenta, :mode=>:bold)
    character = "(ﾉ◕ヮ◕)ﾉ*:･ﾟ".colorize(:color=>:blue) + "✧ ".colorize(:color=>:light_yellow)
    3.times {print character + " " + goodbye + " "}
    puts ""
    # url = 'https://www.youtube.com/watch?v=dQw4w9WgXcQ'
    # `open #{url}` #WARNING: uncomment for a good time
  end

end
