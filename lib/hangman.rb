class Hangman
  include HelperMethods
  attr_accessor :movie_name

  def initialize
    @lives = 6
    @used_letters = []
    @alphabet = ("a".."z").to_a
    @movie_name = Movie.all.map { |movie_instance| movie_instance.name }.sample.downcase
  end

  def check_movie(movie_name)
    words = movie_name.downcase.split
    words = words.map do |word|
      word.chars.map do |char|
        @used_letters.include?(char) || !@alphabet.include?(char) ? char : "#"
      end.join.capitalize
    end
    words.join(" ")
  end

  def greet
    puts ""
    puts "Welcome to Movie Hangman!".colorize(:color=>:green, :mode=>:bold)
    puts "Type 'exit' at any time to return to main menu"
    puts ""
  end

  def turn
    while true
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
        hangman_man
      end

      if @used_letters.include?(letter)
        puts "You already used this letter, please enter another one!".colorize(:color=>red)
        puts ""
      end

      if @lives == 0
        puts ""
        puts "You ran out of lives!"
        puts "The movie was: " + @movie_name.split.map(&:capitalize).join(" ")
        return main_menu
      end

      @used_letters << letter unless @used_letters.include?(letter)

      if check_movie(@movie_name).count("#") == 0
        character = "٩(◕‿◕｡)۶  ".colorize(:color=>:magenta, :mode=> :bold)
        puts ""
        puts check_movie(@movie_name).colorize(:color=>:green, :mode=>:bold)
        puts ""
        puts rainbowize("Congrats! You Win!!!")
        puts ""
        3.times {print character}
        puts ""
        return main_menu
      end

      puts ""
      puts check_movie(@movie_name)
      puts ""
    end
  end

  def hangman_man
    case @lives
      when 6
        puts ""
        puts "      __________"
        puts "      |        |"
        puts "               |"
        puts "               |"
        puts "               |"
        puts "               |"
        puts "               |"
        puts "    ============"
      when 5
        puts ""
        puts "      __________"
        puts "      |        |"
        puts "      0        |"
        puts "               |"
        puts "               |"
        puts "               |"
        puts "               |"
        puts "    ============"
      when 4
        puts ""
        puts "      __________"
        puts "      |        |"
        puts "      0        |"
        puts "      |        |"
        puts "      |        |"
        puts "               |"
        puts "               |"
        puts "    ============"
      when 3
        puts ""
        puts "      __________"
        puts "      |        |"
        puts "      0        |"
        puts "      |/       |"
        puts "      |        |"
        puts "               |"
        puts "               |"
        puts "    ============"
      when 2
        puts ""
        puts "      __________"
        puts "      |        |"
        puts "      0        |"
        puts "     \\|/       |"
        puts "      |        |"
        puts "               |"
        puts "               |"
        puts "    ============"
      when 1
        puts ""
        puts "      __________"
        puts "      |        |"
        puts "      0        |"
        puts "     \\|/       |"
        puts "      |        |"
        puts "     /         |"
        puts "               |"
        puts "    ============"
      when 0
        puts ""
        puts "      __________"
        puts "      |        |"
        puts "      0        |"
        puts "     \\|/       |"
        puts "      |        |"
        puts "     / \\       |"
        puts "               |"
        puts "    ============"
    end
  end

  def run
    greet
    turn
  end

end
