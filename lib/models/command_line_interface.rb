def welcome
  puts "Welcome to out Group project. It's a collection of 'Girl' TV Shows"
end

def user_input
  print "Input Here: "
  input = gets.chomp
  input.to_s
end

def user_integer_input
  print "Input Here: "
  input = gets.chomp
  input.to_i
end
################################# MAIN MENU #################################
def main_menu(user)
  puts "\n---------Main Menu---------"
  puts "Current User: #{user.name}"
  puts "\n1.'Show all shows' to display all shows"
  puts "2.'Find a show' to search for a selected show"
  puts "3.'Write a review' to write a review for a selected show"
  puts "4.'List my reviews' to see all the reviews of all the shows that you've made"
  puts "5.'Recommended' to show 5 recommended shows based on your reviews"
  puts "\n6.'Log Out'"
  puts "7.'Exit'"

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
    tv_show_menu(user)
  when "find a show"
    tv_show_menu(user)
  when "3"
    add_review(user)
  when "write a review"
    add_review(user)
  when "4"
    review_menu(user)
  when "list my reviews"
    review_menu(user)
  when "5"
    recommended_shows(user)
  when "recommended"
    recommended_shows(user)
  when "log out"
    login_menu
  when "exit"
    puts "Goodbye!"
  else
    puts "Unknown option! Please try again."
    main_menu(user)
  end
end

################################### TV SHOW MENU ##############################
def tv_show_menu(user)

  puts "\nBack"
  puts "\nEnter a show's number to get it's information"
  inp = user_integer_input
  if inp <= 0 || inp > all_tv_shows.size
    puts "Invalid index! Choose again..."
    tv_show_menu(user)
  else
    show = all_tv_shows[inp - 1]

    if all_tv_shows.include?(show)
      puts "\nShow name: #{show.name}"
      puts "\n'rating', 'genre', 'status', 'reviews', or 'back'"
      inp2 = user_input.downcase

      if inp2 == 'rating'
        if show.rating
          puts " "
          puts show.rating
          puts "\nGet another show?(y/n)"
          puts " "
          inp3 = user_input.downcase

          if inp3 == 'y'
            tv_show_menu(user)
          else
            main_menu(user)
          end
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
        puts "\nGet another show?(y/n)"
        puts " "
        inp3 = user_input.downcase

        if inp3 == 'y'
          tv_show_menu(user)
        else
          main_menu(user)
        end
      elsif inp2 == 'status'
        puts " "
        puts show.status
        puts "\nGet another show?(y/n)"
        puts " "
        inp3 = user_input.downcase

        if inp3 == 'y'
          tv_show_menu(user)
        else
          main_menu(user)
        end
      elsif inp2 == 'reviews'
        count = 0
        if show.reviews.empty?
          puts " "
          puts "The show has no reviews."
          puts "\nPick another show?(y/n)"
          puts " "
          inp3 = user_input.downcase

          if inp3 == 'y'
            tv_show_menu(user)
          else
            main_menu(user)
          end
        else
          puts " "
          show.reviews.each do |rev|
            count += 1
            puts "#{count}.'#{rev.review}' by #{rev.user.name}"
          end
          puts "\nGet another show?(y/n)"
          puts " "
          inp3 = user_input.downcase

          if inp3 == 'y'
            tv_show_menu(user)
          else
            main_menu(user)
          end
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

    puts "\nGet 5 more recommendations?(y/n)"
    inp = user_input.downcase

    if inp == 'y'
      recommended_shows(user)
    else
      main_menu(user)
    end
  else
    puts "\nThere are no recommendations for you! Do you want to pick a genre?(y/n)"
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
  puts "\nAll Shows:"
  list_all(all_tv_show_names)
  puts "\nBack"
  puts"\nEnter a show you want to leave a review for:"
  inp = user_input.downcase

  str = inp.split(" ")
  name = str.map{|element| element.capitalize}.join(" ")

  if all_tv_show_names.include?(name)
    show = TvShow.find_by(name: name)
    puts "Insert a review for the show #{name}, or 'back' to go back to the main menu"
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
  elsif name == "back"
    main_menu(user)
  else
    puts "Couldn't find the show! Try again..."
    add_review(user)
  end
end
################################ 'REVIES MENU' #############################
def review_menu(user)
  puts "\nALL REVIEWS BY #{user.name}:"
  puts " "
  all_reviews(user)
  puts "\nBack"
  puts " "
  inp = user_input.downcase
  if inp == "back"
    main_menu(user)
  else
    review_menu(user)
  end
end
################################ ARRAYS #############################
def list_all(array)
  array.each do |element|
    puts "- #{element}"
  end
end

def all_reviews(user)
  if user.reviews.empty?
    puts "You haven't rated anything yet"
  else
    user.reviews.each do |review_instance|
      puts "'#{review_instance.review}': #{review_instance.tv_show.name}"
    end
  end
end

def all_genres_array
  TvShow.all.map {|show| show.genre}.uniq.compact
end

def all_tv_shows
  TvShow.all.map{|show| show}
end

def list_all_tv_shows
  TvShow.all.each_with_index {|show, ind| puts "#{ind + 1}.#{show.name}"}
end

def all_tv_show_names
  TvShow.all.map {|show| show.name}
end

def user_names
  User.all.map {|user| user.name}
end

################################ 'LOGIN MENU' ###############################
def login_menu
  puts "\nWelcome to the login menu. Type your user name to log-in, or 'exit' to quit:"
  list_all(user_names)
  puts " "
  inp = user_input
  if user_names.include?(inp)
    user = User.find_by(name: inp)
    main_menu(user)
  elsif inp.downcase == "exit"
    puts "Goodbye!"
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
