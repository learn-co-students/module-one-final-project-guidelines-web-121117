class Hangman
  include HelperMethods
  attr_accessor :movie_name

  def initialize
    @lives = 6
    @used_letters = []
    @alphabet = ("a".."z").to_a
    @movie_name = Movie.all.map { |inst| inst.name }.sample.downcase
  end

  def check_movie(movie_name)
    words = movie_name.downcase.split
    words = words.map do |word|
      word.chars.map do |char|
        @used_letters.include?(char) ? char : "#"
      end.join.capitalize
    end
    words.join(" ")
  end

  def greet
    puts ""
    puts "Welcome to Movie Hangman!".colorize(:color=>:green, :mode=>:bold)
  end

  def turn
    while true
      puts ""
      # puts "You have " + "#{@lives}" + " lives remaining!"
      puts "You have #{@lives} lives remaining!".colorize(:color=>:red)
      puts "Used letters: " + @used_letters.map(&:upcase).join(" ").colorize(:color=>:red)
      puts ""
      puts "Current Movie State: ".colorize(:mode=>:bold) + check_movie(@movie_name)
      puts ""
      puts "Please enter a letter:".colorize(:mode=>:bold)
      letter = gets.chomp.downcase
      return main_menu if letter == "exit"
      if !@movie_name.chars.include?(letter) || !@alphabet.include?(letter)
        puts "You entered an incorrect letter, YOU LOSE A LIFE!"
        @lives -= 1
      end

      if @used_letters.include?(letter)
        puts "You already used this letter, please enter another one!"
        puts ""
      end

      if @lives == 0
        puts ""
        puts "You ran out of lives!"
        puts "The movie was: " + @movie_name.split.map(&:capitalize).join(" ")
        break
      end

      @used_letters << letter

      if check_movie(@movie_name).count("#") == 0
        puts ""
        puts "٩(◕‿◕｡)۶".colorize(:color=>:magenta)
        puts ""
        puts check_movie(@movie_name).colorize(:color=>:cyan, :mode=>:bold)
        puts ""
        puts "Congrats! You win!!!".colorize(:color=>:magenta, :mode=>:bold)
        puts ""
        puts "٩(◕‿◕｡)۶".colorize(:color=>:magenta)
        return main_menu
      end

      puts ""
      puts check_movie(@movie_name)
      puts ""
    end
  end

  def run
    greet
    turn
  end


end
