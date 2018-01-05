module HouseSpecificMenu

  def user_house_selection
    pre_find_house
    house_choice = gets.chomp
    house = find_house(house_choice)
  end

  def search_house_options
    puts "\nDo you know which house you would like to search? Put 'Y' or 'N'."
    user_input = gets.downcase.chomp
    if user_input == 'y'
      puts "\nGreat! Please put in a house name or first few letters of the house's name"
      puts "and we will try to populate the closest matches for you to choose from:"
      house_choice = gets.chomp
      house = find_house(house_choice)
      house
    elsif user_input == 'n'
      puts "\nWould you like to see a full list of houses to select from? Put 'Y' or 'N':"
      user_search = gets.downcase.chomp
      if user_search == 'y'
        house = user_house_selection
        house
      elsif user_search == 'n'
        puts "\nAlright. Sending you back to the house menu."
        houses_menu
      else
        puts "\nThat is not an option. Going back to the house menu."
        houses_menu
      end
    else
      puts "\nThat is not an option. Going back to the house menu."
      houses_menu
    end
  end


  def house_specifics_menu_options
    puts "\nSEARCH HOUSE MENU".colorize(:green).underline
    puts "Choose from one of the following categories to proceed:"
    puts "     Characters".colorize(:green) + " - see which characters belong to a specific house."
    puts "     Gender".colorize(:green) + " - see how many members of a specific gender belong to a specific house."
    puts "     Lord".colorize(:green) + " - see which character is currently the Lord of a specific house."
    puts "     Region".colorize(:green) + " - see what region a house is located."
    puts "     House Menu".colorize(:green) + " - back to the house menu."
    puts "     Main Menu".colorize(:green) + " - back to the main menu."
    puts "\nPlease make a selection:"
    user_input = gets.downcase.chomp
  end

  def continue_with_house(house)
    puts "\nWould you like to continue searching #{house.name}? Please type 'Y' or 'N'."
    user_input = gets.downcase.chomp
    if user_input == 'y'
      new_user_input = house_specifics_menu_options
      user_house_selections_main_menu(new_user_input, house)
    elsif user_input == 'n'
      puts "\nWould you like to search another house? Please type 'Y', or 'N'?"
      user_input = gets.downcase.chomp
      if user_input == 'y'
        house_specific_run
      elsif user_input == 'n'
        puts "\nGreat! Going back to house main menu."
        houses_menu
      else
        puts "\nThat's not an option. Going back to house main menu."
        houses_menu
      end
    else
      puts "\nThat's not an option. Going back to house main menu."
      houses_menu
    end
  end

  def user_house_selections_main_menu(user_input, house_specific)
    house = house_specific
    if user_input == "characters"
      characters = house.characters
      puts "\nHere are the characters with allegiances to #{house.name}:"
      show_characters(characters)
      puts "\n"
      continue_with_house(house)
    elsif user_input == "gender"
      characters_from_house = house.characters
      puts "\nWould you like to see the males or females of #{house.name}. Please put 'Male' or 'Female':"
      gender_input = gets.chomp
      puts "\nHere are the characters of #{house.name} who identify as #{gender_input}:"
      find_characters_by_gender(characters_from_house, gender_input)
      puts "\n"
      continue_with_house(house)
    elsif user_input == "lord"
      if house.current_lord_id == nil
        puts "\nThere is no current lord for #{house.name}."
      else
        character = Character.find(house.current_lord_id)
        puts "\nThe current lord of #{house.name} is #{character.name}."
        puts "\n"
      end
      continue_with_house(house)
    elsif user_input == "region"
      puts "\nThe region where you can find #{house.name} is #{house.region.name}."
      puts "\n"
      continue_with_house(house)
    elsif user_input == 'character menu'
      character_menu
    elsif user_input == 'main menu'
      main_menu_run
    else
      puts "\nThat's not one of the choices. Please try again."
      house_specifics_menu(house)
    end
  end

  def house_specifics_menu(house)
    house_specific = house
    user_input = house_specifics_menu_options

    if user_input == "character menu"
      characters_menu
    elsif user_input == "main menu"
      main_menu_run
    elsif user_input == "exit"
      system("clear")
      good_bye
    else
      user_house_selections_main_menu(user_input, house_specific)
    end
  end

  def house_specific_run
    house = search_house_options
    puts "\nYou are now searching for #{house.name}"
    house_specifics_menu(house)
  end

end
