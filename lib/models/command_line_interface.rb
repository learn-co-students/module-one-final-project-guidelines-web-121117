def welcome
  puts "Welcome to out Group project. It's a collection of 'Girl' TV Shows"
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
  puts "\n1.'Show all shows' to display all shows"
  puts "2.'Write a review' to write a review for a selected show"
  puts "\n3.'Log Out'"
  puts "4.'Exit'"

  inp = user_input.downcase

  case inp
  when "1"
    tv_show_menu(user)
  when "show all shows"
    tv_show_menu(user)
  when "2"
    add_review(user)
  when "write a review"
    add_review(user)
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
  puts "\nAll Shows:"
  list_all(all_tv_show_names)
  puts "\nBack"
  puts "\nEnter a show's number to get it's information"
  inp = user_input.downcase

  str = inp.split(" ")
  name = str.map{|element| element.capitalize}.join(" ")

  if all_tv_show_names.include?(name)
    show = TvShow.find_by(name: name)
    puts "\n'rating', 'status' or 'reviews'"
    inp2 = user_input.downcase

    if inp2 == 'rating'
      if show.rating
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
        puts "The show hasn't been rated yet."
        tv_show_menu(user)
      end
    elsif inp2 == 'status'
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
        puts "The show has no reviews."
        tv_show_menu(user)
      else
        show.reviews.each do |rev|
          count += 1
          puts "#{count}.'#{rev.review}' by #{rev.user.name}"
        end
        tv_show_menu(user)
      end
    else
      puts "Unknown option! Try again..."
      tv_show_menu(user)
    end
  elsif inp == 'back'
    main_menu(user)
  else
    puts "Can't find show"
    tv_show_menu(user)
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
    puts "Insert a review for the show #{name}:"
    inp2 = user_input
    rev = Review.create(review: "#{inp2}")
    show.reviews << rev
    user.reviews << rev
    puts "\nReview has been added!"
    main_menu(user)
  elsif name == "Back"
    main_menu(user)
  else
    puts "Couldn't find the show! Try again..."
    add_review(user)
  end
end
################################ ARRAYS #############################
def list_all(array)
  count = 0
  array.each do |element|
    count += 1
    puts "#{count}. #{element}"
  end
end

def all_tv_show_names
  TvShow.all.map {|show| show.name}
end

def user_names
  User.all.map {|user| user.name}
end

################################ 'LOGIN MENU' ###############################
def login_menu
  puts "\nWelcome to the login menu. Type your user name to log-in:"
  list_all(user_names)
  puts " "
  inp = user_input
  if user_names.include?(inp)
    user = User.find_by(name: inp)
    main_menu(user)
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
