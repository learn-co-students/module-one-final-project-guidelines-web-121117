require 'pry'
require 'colorize'

arter = Artii::Base.new
puts arter.asciify("welcome").colorize(:blue)

def welcome
  puts "Welcome to our group project. We hope you enjoy!".colorize(:light_yellow)
end

def user_input
  print "Input Here: "
  input = gets.chomp
  input.to_s
end
################################# MAIN MENU #################################
def main_menu(user)
  puts "\n---------Main Menu---------".colorize(:blue)
  puts "Current User: #{user.name}"
  puts "\n1".colorize(:light_red)+".'Show All Shows'".colorize(:light_blue)+" to display all shows"
  puts "2".colorize(:light_red)+".'Write a Review'".colorize(:light_blue)+" to write a review for a selected show"
  puts "3".colorize(:light_red)+".'List My Reviews'".colorize(:light_blue)+" to see all the reviews of all the shows that you've made"
  puts "4".colorize(:light_red)+".'Recommended'".colorize(:light_blue)+" to show 5 recommended shows based on your reviews"
  puts "5".colorize(:light_red)+".'Top Rated'".colorize(:light_blue)+" to view 10 of the top rated shows"
  puts "6".colorize(:light_red)+".'Play'".colorize(:light_blue)+" to play a game of dice"
  puts "\n7".colorize(:light_red)+".'Log Out'".colorize(:light_blue)
  puts "8".colorize(:light_red)+".'Exit'".colorize(:light_blue)

  inp = user_input.downcase

  case inp
  when "1"
    puts "\nAll Shows:"
    TvShow.list_all_tv_shows
    tv_show_menu(user)
  when "show all shows"
    puts "\nAll Shows:"
    TvShow.list_all_tv_shows
    tv_show_menu(user)
  when "2"
    puts "\nAll Shows:"
    TvShow.list_all_tv_shows
    add_review(user)
  when "write a review"
    puts "\nAll Shows:"
    TvShow.list_all_tv_shows
    add_review(user)
  when "3" then review_menu(user)
  when "list my reviews" then review_menu(user)
  when "4" then recommended_shows(user)
  when "recommended" then recommended_shows(user)
  when "5" then top_rated(user)
  when "top rated" then top_rated(user)
  when "6" then welcome_to_dice_game(user)
  when 'play' then welcome_to_dice_game(user)
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

  puts "\n'back'".colorize(:light_blue)+" to go back to the main menu"
  puts "\nEnter a show's number to get it's information,\n"+"'list'".colorize(:light_blue)+" to list all shows, or "+"'back'".colorize(:light_blue)+" to go back to the menu"
  inp = user_input.downcase

  if inp == 'back'
    main_menu(user)
  elsif inp == 'list'
    TvShow.list_all_tv_shows
    tv_show_menu(user)
  else
    inp = inp.to_i
    if inp <= 0 || inp > TvShow.all_tv_shows.size
      puts "Invalid index! Choose again..."
      tv_show_menu(user)
    else
      show = TvShow.all_tv_shows[inp - 1]

      if TvShow.all_tv_shows.include?(show)
        puts "\nShow name: #{show.name}"
        puts "\n'rating'".colorize(:light_blue)+", "+"'genre'".colorize(:light_blue)+", "+"'status'".colorize(:light_blue)+", "+"'reviews'".colorize(:light_blue)+", or "+"'back'".colorize(:light_blue)
        inp2 = user_input.downcase

        if inp2 == 'rating'
          if show.rating
            puts " "
            puts show.rating
            puts "\nGet another show?("+"y".colorize(:green)+"/"+"n".colorize(:red)+")"
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
          puts "\nGet another show?("+"y".colorize(:green)+"/"+"n".colorize(:red)+")"
          puts " "
          inp3 = user_input.downcase
          inp3 == 'y' ? tv_show_menu(user) : main_menu(user)
        elsif inp2 == 'status'
          puts " "
          puts show.status
          puts "\nGet another show?("+"y".colorize(:green)+"/"+"n".colorize(:red)+")"
          puts " "
          inp3 = user_input.downcase
          inp3 == 'y' ? tv_show_menu(user) : main_menu(user)
        elsif inp2 == 'reviews'
          count = 0
          if show.reviews.empty?
            puts " "
            puts "The show has no reviews."
            puts "\nGet another show?("+"y".colorize(:green)+"/"+"n".colorize(:red)+")"
            puts " "
            inp3 = user_input.downcase
            inp3 == 'y' ? tv_show_menu(user) : main_menu(user)
          else
            puts " "
            show.reviews.each.with_index(1) {|rev, ind| puts "#{ind}.'#{rev.review}' by #{rev.user.name}"}
            puts "\nGet another show?("+"y".colorize(:green)+"/"+"n".colorize(:red)+")"
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
    puts "\nGet 5 more recommendations?("+"y".colorize(:green)+"/"+"n".colorize(:red)+")"
    inp = user_input.downcase
    inp == 'y' ? recommended_shows(user) : main_menu(user)
  else
    puts "\nThere are no recommendations for you! Do you want to pick a genre?("+"y".colorize(:green)+"/"+"n".colorize(:red)+")"
    inp = user_input.downcase

    if inp == 'y'
      puts "Existing genres: #{TvShow.all_genres_array.join(", ")}"
      inp2 = user_input.downcase
      most_rated_genre = inp2.capitalize
      if TvShow.all_genres_array.include?(most_rated_genre)
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
    if inp <= 0 || inp > TvShow.all_tv_shows.size
      puts "Invalid index! Choose again..."
      add_review(user)
    else
      show = TvShow.all_tv_shows[inp - 1]
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
  puts "\nPress "+"'back'".colorize(:light_blue)+" to go back to the main menu"
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
  array.each_with_index {|element, ind| puts "#{ind + 1}.".colorize(:light_red)+"#{element}".colorize(:light_blue)}
end

def all_reviews(user)
  if user.reviews.empty?
    puts "You haven't rated anything yet"
  else
    user.reviews.each { |review_instance| puts "'#{review_instance.review}': #{review_instance.tv_show.name}" }
  end
end
################################ 'LOGIN MENU' ###############################
def login_menu
  puts "\nType your user name to log-in,\n"+"'list'".colorize(:light_blue)+" to list all users, or "+"'exit'".colorize(:light_blue)+" to quit:"
  puts " "
  inp = user_input
  if User.user_names.include?(inp)
    user = User.find_by(name: inp)
    main_menu(user)
  elsif inp.downcase == 'list'
    puts "\nAll Users:"
    puts " "
    User.user_names.each do |user_name|
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
    else
      inp.strip!
      inp = inp.split(" ").join(" ")
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
################################ 'DICE GAME' ###############################

def welcome_to_dice_game(user)
  puts " "
  arter = Artii::Base.new
  puts arter.asciify("welcome to dice").colorize(:yellow)
  game(user)
end

def game(user)
  puts "\n------------Game Menu------------".colorize(:blue)
  puts "\nDo you want to play vs "+"'computer'".colorize(:light_blue)+" or vs "+"'friend'".colorize(:light_blue)+""
  puts "or do you want to go "+"'back'".colorize(:light_blue)+" to the game menu"
  puts " "
  inp = user_input.downcase

  case inp
  when 'computer'
    puts "#{user.name}, press"+" 'return'".colorize(:blue)+" to roll your dice"
    u_input = gets.chomp
    puts " "
    player1 = rand(6) + 1
    puts "#{user.name}, you rolled a #{player1}.".colorize(:light_blue)
    com = rand(6) + 1
    puts "The computer rolled a #{com}.".colorize(:light_yellow)
    if player1 > com
      puts "\nCongratulations #{user.name}! You won!".colorize(:yellow)
      puts " "
      puts "  ƪ(˘⌣˘)ʃ ".colorize(:yellow)+"ƪ(˘⌣˘)┐".colorize(:yellow)+"┌(˘⌣˘)ʃ".colorize(:yellow)
      game(user)
    elsif player1 == com
      puts " "
      puts "It's a DRAW! Miserable...(╯°□°）╯︵ ┻━┻".colorize(:yellow)
      game(user)
    else
      puts " "
      puts "BOOOO #{user.name}! You lost... miserably...".colorize(:yellow)
      puts " "
      puts"    "+"▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄".colorize(:yellow)
      puts"    "+"████▌▄▌▄▐▐▌█████".colorize(:yellow)
      puts"    "+"████▌▄▌▄▐▐▌▀████".colorize(:yellow)
      puts"    "+"▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀".colorize(:yellow)
      game(user)
    end
  when 'friend'
    print "\nInsert the name of your friend: "
    puts " "
    friend = gets.chomp.to_s
    if friend.split(" ").empty?
      friend = "Unknown"
      dice(user, friend)
    elsif friend.match(/  /)
      friend.strip!
      friend = friend.split(" ").join(" ")
      dice(user, friend)
    elsif friend[0] == " " || friend[-1] == " "
      friend.strip!
      friend = friend.split(" ").join(" ")
      dice(user, friend)
    else
      dice(user, friend)
    end
  when 'back' then main_menu(user)
  else
    puts "Unknown option!"
    game(user)
  end
end

def dice(user, friend)
  puts "#{friend}, press"+" 'return'".colorize(:blue)+" to roll your dice"
  u_input = gets.chomp
  puts " "
  friend_roll = rand(6) + 1
  puts "#{friend}, you rolled a #{friend_roll}.".colorize(:yellow)
  puts " "
  puts "#{user.name}, press"+" 'return'".colorize(:blue)+" to roll your dice"
  u_input = gets.chomp
  puts " "
  player1 = rand(6) + 1
  puts "#{user.name}, you rolled a #{player1}.".colorize(:blue)
  puts " "

  if friend_roll > player1
    puts "\nCongratulations #{friend}! You ROCK!".colorize(:yellow)
    puts " "
    puts " ┗( ^o^)┛ ≡ ┏( ^o^)┓ ≡ ┗( ^o^)┛ ".colorize(:yellow)
    puts " "
    puts "\nRematch!?("+"y".colorize(:green)+"/"+"n".colorize(:red)+")"
    inp = user_input.downcase
    inp == 'y' ? dice(user, friend) : game(user)
  elsif friend_roll == player1
    puts " "
    puts "It's a DRAW! You both suck..."
    puts "ヽ(#ﾟДﾟ)ﾉ┌┛Σ(ノ´Д`)ノ".colorize(:yellow)
    puts " "
    puts "\nRematch!?("+"y".colorize(:green)+"/"+"n".colorize(:red)+")"
    inp = user_input.downcase
    inp == 'y' ? dice(user, friend) : game(user)
  else
    puts " "
    puts "\nGood job #{user.name}. Don't worry #{friend} you'll get him next time!".colorize(:yellow)
    puts " "
    puts "\nRematch!?("+"y".colorize(:green)+"/"+"n".colorize(:red)+")"
    inp = user_input.downcase
    inp == 'y' ? dice(user, friend) : game(user)
  end
end
