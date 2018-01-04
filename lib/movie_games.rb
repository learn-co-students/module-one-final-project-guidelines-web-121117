class MovieGames
  attr_accessor :movie_name

  def initialize
    @turn = 0
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
    puts "Welcome to Movie Hangman!"
  end

  def turn
    while true
      puts ""
      puts "You have #{@lives} lives remaining!"
      puts "Current Movie State: " + check_movie(@movie_name)
      puts ""
      puts "Please enter a letter:"
      letter = gets.chomp.downcase

      if !@movie_name.chars.include?(letter) || !@alphabet.include?(letter)
        puts "You entered an incorrect letter, YOU LOSE A LIFE!"
        @lives -= 1
      end

      if @used_letters.include?(letter)
        puts "You already used this letter, please enter another one!"
      end

      if @lives == 0
        puts "You ran out of lives!"
        break
      end

      if check_movie(@movie_name).count("#") == 0
        puts "Congrats! You win!!!"
        break
      end

      @used_letters << letter
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
