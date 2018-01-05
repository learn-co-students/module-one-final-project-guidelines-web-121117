require 'pry'
require 'colorize'

def welcome
  puts "Welcome to out Group project. We hope you enjoy!"
end

def user_input
  print "Input Here: "
  input = gets.chomp
  input.to_s
end

################################# MAIN MENU #################################
def main_menu(user)
  puts "\n---------Main Menu---------"
  puts "Current User: #{user.name}"
  puts "\n1".colorize(:light_red)+".'Show all shows'".colorize(:light_blue)+" to display all shows"
  puts "2".colorize(:light_red)+".'Write a review'".colorize(:light_blue)+" to write a review for a selected show"
  puts "3".colorize(:light_red)+".'List my reviews'".colorize(:light_blue)+" to see all the reviews of all the shows that you've made"
  puts "4".colorize(:light_red)+".'Recommended'".colorize(:light_blue)+" to show 5 recommended shows based on your reviews"
  puts "5".colorize(:light_red)+".'Top Rated'".colorize(:light_blue)+" to view 10 of the top rated shows"
  puts "6".colorize(:light_red)+".'Play'".colorize(:light_blue)+" to play a game"
  puts "\n7".colorize(:light_red)+".'Log Out'".colorize(:light_blue)
  puts "8".colorize(:light_red)+".'Exit'".colorize(:light_blue)

  inp = user_input.downcase

  case inp
  when "1"
    puts "\nAll Shows:"
    list_all_tv_shows
    tv_show_menu(user)
  when "show all shows"
    puts "\nAll Shows:"
    list_all_tv_shows
    tv_show_menu(user)
  when "2"
    puts "\nAll Shows:"
    list_all_tv_shows
    add_review(user)
  when "write a review"
    puts "\nAll Shows:"
    list_all_tv_shows
    add_review(user)
  when "3" then review_menu(user)
  when "list my reviews" then review_menu(user)
  when "4" then recommended_shows(user)
  when "recommended" then recommended_shows(user)
  when "5" then top_rated(user)
  when "top rated" then top_rated(user)
  when "6" then game_menu(user)
  when 'play' then game_menu(user)
  when "log out" then login_menu
  when "7" then login_menu
  when "exit" then puts "Goodbye!"
  when "8" then puts "Goodbye!"
  else
    puts "Unknown option! Please try again."
    main_menu(user)
  end
end

################################### TV SHOW MENU ##############################
def tv_show_menu(user)

  puts "\n'Back'".colorize(:light_blue)+" to go back to the main menu"
  puts "\nEnter a show's number to get it's information,\n"+"'list'".colorize(:light_blue)+" to list all shows, or "+"'back'".colorize(:light_blue)+" to go back to the menu"
  inp = user_input.downcase

  if inp == 'back'
    main_menu(user)
  elsif inp == 'list'
    list_all_tv_shows
    tv_show_menu(user)
  else
    inp = inp.to_i
    if inp <= 0 || inp > all_tv_shows.size
      puts "Invalid index! Choose again..."
      tv_show_menu(user)
    else
      show = all_tv_shows[inp - 1]

      if all_tv_shows.include?(show)
        puts "\nShow name: #{show.name}"
        puts "\n'rating'".colorize(:light_blue)+", "+"'genre'".colorize(:light_blue)+", "+"'status'".colorize(:light_blue)+", "+"'reviews'".colorize(:light_blue)+", or "+"'back'".colorize(:light_blue)
        inp2 = user_input.downcase

        if inp2 == 'rating'
          if show.rating
            puts " "
            puts show.rating
            puts "\nGet another show?("+"y".colorize(:light_green)+"/"+"n".colorize(:light_red)+")"
            puts " "
            inp3 = user_input.downcase
            inp3 == 'y' ? tv_show_menu(user) : main_menu(user)
          else
            puts " "
            puts "The show hasn't been rated yet."
            tv_show_menu(user)
          end
        elsif inp2 == 'back'
          main_menu(user)
        elsif inp2 == "genre"
          puts " "
          puts show.genre
          puts "\nGet another show?("+"y".colorize(:light_green)+"/"+"n".colorize(:light_red)+")"
          puts " "
          inp3 = user_input.downcase
          inp3 == 'y' ? tv_show_menu(user) : main_menu(user)
        elsif inp2 == 'status'
          puts " "
          puts show.status
          puts "\nGet another show?("+"y".colorize(:light_green)+"/"+"n".colorize(:light_red)+")"
          puts " "
          inp3 = user_input.downcase
          inp3 == 'y' ? tv_show_menu(user) : main_menu(user)
        elsif inp2 == 'reviews'
          count = 0
          if show.reviews.empty?
            puts " "
            puts "The show has no reviews."
            puts "\nGet another show?("+"y".colorize(:light_green)+"/"+"n".colorize(:light_red)+")"
            puts " "
            inp3 = user_input.downcase
            inp3 == 'y' ? tv_show_menu(user) : main_menu(user)
          else
            puts " "
            show.reviews.each.with_index(1) {|rev, ind| puts "#{ind}.'#{rev.review}' by #{rev.user.name}"}
            puts "\nGet another show?("+"y".colorize(:light_green)+"/"+"n".colorize(:light_red)+")"
            puts " "
            inp3 = user_input.downcase
            inp3 == 'y' ? tv_show_menu(user) : main_menu(user)
          end
        else
          puts "Unknown option! Try again..."
          tv_show_menu(user)
        end
      elsif inp == 'back'
        main_menu(user)
      else
        puts " "
        puts "Can't find show"
        tv_show_menu(user)
      end
    end
  end
end
################################### RECOMMENDED MENU ##############################
def recommended_shows(user)
  genres = user.reviews.map {|review_instance| review_instance.tv_show.genre}
  if !genres.empty?
    sorted_genres = genres.sort_by {|genre| genres.count(genre)}.reverse
    most_rated_genre = sorted_genres[0]
    recommended_array = TvShow.all.select{|show| show.genre == most_rated_genre}.sample(5)
    recommended_by_rating = recommended_array.sort_by{|show| show.rating}.reverse
    recommended_array_names = recommended_by_rating.map {|show| "#{show.name}: #{show.rating}"}
    puts " "
    list_all(recommended_array_names)
    puts "\nGet 5 more recommendations?("+"y".colorize(:light_green)+"/"+"n".colorize(:light_red)+")"
    inp = user_input.downcase
    inp == 'y' ? recommended_shows(user) : main_menu(user)
  else
    puts "\nThere are no recommendations for you! Do you want to pick a genre?("+"y".colorize(:light_green)+"/"+"n".colorize(:light_red)+")"
    inp = user_input.downcase

    if inp == 'y'
      puts "Existing genres: #{all_genres_array.join(", ")}"
      inp2 = user_input.downcase
      most_rated_genre = inp2.capitalize
      if all_genres_array.include?(most_rated_genre)
        recommended_array = TvShow.all.select{|show| show.genre == most_rated_genre}.sample(5)
        recommended_by_rating = recommended_array.sort_by{|show| show.rating}.reverse
        recommended_array_names = recommended_by_rating.map {|show| "#{show.name}: #{show.rating}"}
        puts " "
        list_all(recommended_array_names)
        main_menu(user)
      else
        puts "Couldn't find the selected genre!"
        main_menu(user)
      end
    else
      main_menu(user)
    end
  end
end
################################ 'ADD REVIEWS' MENU ###############################
def add_review(user)
  puts "\nType "+"'back'".colorize(:light_blue)+" to go back to main menu"
  puts"\nEnter a number of the show you want to leave a review for:"
  inp = user_input.downcase

  if inp == 'back'
    main_menu(user)
  else
    inp = inp.to_i
    if inp <= 0 || inp > all_tv_shows.size
      puts "Invalid index! Choose again..."
      add_review(user)
    else
      show = all_tv_shows[inp - 1]
      puts "Insert a review for the show #{show.name}, or "+"'back'".colorize(:light_blue)+" to go back to the main menu"
      inp2 = user_input
      if inp2.downcase == "back"
        main_menu(user)
      else
        rev = Review.create(review: "#{inp2}")
        show.reviews << rev
        user.reviews << rev
        puts "\nReview has been added!"
        main_menu(user)
      end
    end
  end
end
################################ TOP RATED SHOWS #############################
def top_rated(user)
  puts " "
  sorted_array = TvShow.order(rating: :desc).limit(10)
  final_array = sorted_array.map {|show| "#{show.name}: #{show.rating}"}
  list_all(final_array)
  puts "\nPress 'return' to go back to the main menu"
  inp = gets.chomp
  main_menu(user)
end
################################ 'REVIES MENU' #############################
def review_menu(user)
  puts "\nALL REVIEWS BY #{user.name}:"
  puts " "
  all_reviews(user)
  puts "\nType "+"'back'".colorize(:light_blue)+" to go back to the main menu"
  puts " "
  inp = user_input.downcase
  inp == "back" ? main_menu(user) : review_menu(user)
end
################################ ARRAYS #############################
def list_all(array)
  array.each_with_index {|element, ind| puts "#{ind + 1}. #{element}"}
end

def all_reviews(user)
  if user.reviews.empty?
    puts "You haven't rated anything yet"
  else
    user.reviews.each { |review_instance| puts "'#{review_instance.review}': #{review_instance.tv_show.name}" }
  end
end

def all_genres_array
  TvShow.all.map {|show| show.genre}.uniq.compact
end

def all_tv_shows
  TvShow.all.map{|show| show}
end

def list_all_tv_shows
  TvShow.all.each.with_index(1) {|show, ind| puts "#{ind}".colorize(:light_red)+".#{show.name}"}
end

def user_names
  User.all.map {|user| user.name}
end

################################ 'LOGIN MENU' ###############################
def login_menu
  puts "Type your user name to log-in,\n"+"'list'".colorize(:light_blue)+" to list all users, or "+"'exit'".colorize(:light_blue)+" to quit:"
  puts " "
  inp = user_input
  if user_names.include?(inp)
    user = User.find_by(name: inp)
    main_menu(user)
  elsif inp.downcase == 'list'
    puts "\nAll Users:"
    puts " "
    user_names.each do |user_name|
      print "- "
      puts "#{user_name}".colorize(:light_blue)
    end
    puts " "
    login_menu
  elsif inp.downcase == "exit"
    puts "Goodbye!"
  else
    if inp.split(" ").empty?
      puts "Invalid user name!"
      login_menu
    elsif inp.match(/\d/)
      puts "\nThe username can't contain numbers!"
      puts " "
      login_menu
    elsif inp.match(/ /)
      puts "\nThe username can't contain spaces"
      puts " "
      login_menu
    else
      puts "The user doesn't exists! Do you want to create a user with this username? (#{inp})(y/n)"
      inp2 = user_input
      if inp2 == 'y'
        user = User.create(name: inp)
        main_menu(user)
      else
        login_menu
      end
    end
  end
end
################################ 'GAME MENU' ###############################
def game_menu(user)
  puts "\n------------Game Menu------------".colorize(:yellow)
  puts "\n1".colorize(:light_red)+". "+"Type "+"'dice'".colorize(:light_blue)+" to play dice"
  puts "\n'back'".colorize(:light_blue)+" to go back to the main menu"
  inp = user_input.downcase

  case inp
  when "dice"
    puts "\nWelcome to the dice game"
    play_dice(user)
  when "1"
    puts "\nWelcome to the dice game"
    play_dice(user)
  when "back"
    main_menu(user)
  else
    puts "Unknown command!"
    game_menu(user)
  end
end
################################ 'DICE GAME' ###############################
def play_dice(user)
  puts "\nDo you want to play vs "+"'computer'".colorize(:light_blue)+" or vs "+"'friend'".colorize(:light_blue)+""
  puts "or do you want to go "+"'back'".colorize(:light_blue)+" to the game menu"
  puts " "
  inp = user_input.downcase

  case inp
  when 'computer'
    puts "#{user.name}, press 'return' to roll your dice"
    u_input = gets.chomp
    puts " "
    player1 = rand(6) + 1
    puts "#{user.name}, you rolled a #{player1}."
    com = rand(6) + 1
    puts "The computer rolled a #{com}."
    if player1 > com
      puts "\nCongratulations #{user.name}! You won!"
      play_dice(user)
    elsif player1 == com
      puts "It's a DRAW! Miserable..."
      play_dice(user)
    else
      puts "BOOOO #{user.name}! You lost... miserably..."
      play_dice(user)
    end
  when 'friend'
    print "\nInsert the name of your friend: "
    friend = gets.chomp.to_s
    dice(user, friend)
  when 'back'
    game_menu(user)
  else
    puts "Unknown option!"
    play_dice(user)
  end
end

def dice(user, friend)
  puts "#{friend}, press 'return' to roll your dice"
  u_input = gets.chomp
  puts " "
  friend_roll = rand(6) + 1
  puts "#{friend}, you rolled a #{friend_roll}."

  puts "#{user.name}, press 'return' to roll your dice"
  u_input = gets.chomp
  puts " "
  player1 = rand(6) + 1
  puts "#{user.name}, you rolled a #{player1}."

  if friend_roll > player1
    puts "\nCongratulations #{friend}! You ROCK!"
    puts "\nRematch!?("+"y".colorize(:light_green)+"/"+"n".colorize(:light_red)+")"
    inp = user_input.downcase
    inp == 'y' ? dice(user, friend) : play_dice(user)
  elsif friend_roll == player1
    puts "It's a DRAW! You both suck..."
    puts "\nRematch!?("+"y".colorize(:light_green)+"/"+"n".colorize(:light_red)+")"
    inp = user_input.downcase
    inp == 'y' ? dice(user, friend) : play_dice(user)
  else
    puts "\nGood job #{user.name}. Don't worry #{friend} you'll get him next time!"
    puts "\nRematch!?("+"y".colorize(:light_green)+"/"+"n".colorize(:light_red)+")"
    inp = user_input.downcase
    inp == 'y' ? dice(user, friend) : play_dice(user)
  end
end
