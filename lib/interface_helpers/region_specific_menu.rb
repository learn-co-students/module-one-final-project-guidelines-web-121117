module RegionSpecificMenu

  def user_region_selection
    pre_find_region
    region_choice = gets.chomp
    region = find_region(region_choice)
  end

  def search_region_options
    puts "\nDo you know which region you would like to search? Put 'Y' or 'N'."
    user_input = gets.downcase.chomp
    if user_input == 'y'
      puts "\nGreat! Please put in a region name or first few letters of the region's name"
      puts "and we will try to populate the closest matches for you to choose from:"
      region_choice = gets.chomp
      region = find_region(region_choice)
      region
    elsif user_input == 'n'
      puts "\nWould you like to see a full list of regions to select from? Put 'Y' or 'N':"
      user_search = gets.downcase.chomp
      if user_search == 'y'
        region = user_region_selection
        region
      elsif user_search == 'n'
        puts "\nAlright. Sending you back to the region menu."
        regions_menu
      else
        puts "\nThat is not an option. Going back to the region menu."
        regions_menu
      end
    else
      puts "\nThat is not an option. Going back to the region menu."
      regions_menu
    end
  end

  def region_specifics_menu_options
    m = Artii::Base.new
    puts "\n"
    puts m.asciify("SEARCH REGION MENU").colorize(:cyan)
    puts "Choose from one of the following categories to proceed:"
    puts "     Characters".colorize(:cyan) + " - see which characters belong to a specific house."
    puts "     Houses".colorize(:cyan) + " - see how many members of a specific gender belong to a specific house."
    puts "     Region Menu".colorize(:cyan) + " - back to the region menu."
    puts "     Main Menu".colorize(:cyan) + " - back to the main menu."
    puts "\nPlease make a selection:"
    user_input = gets.downcase.chomp
  end

  def continue_with_region(region)
    puts "\nWould you like to continue searching #{region.name}? Please type 'Y' or 'N'."
    user_input = gets.downcase.chomp
    if user_input == 'y'
      new_user_input = region_specifics_menu_options
      user_region_selections_main_menu(new_user_input, region)
    elsif user_input == 'n'
      puts "\nWould you like to search another region? Please type 'Y', or 'N'?"
      user_input = gets.downcase.chomp
      if user_input == 'y'
        region_specific_run
      elsif user_input == 'n'
        puts "\nGreat! Going back to region main menu."
        regions_menu
      else
        puts "\nThat's not an option. Going back to region main menu."
        regions_menu
      end
    else
      puts "\nThat's not an option. Going back to region main menu."
      regions_menu
    end
  end

  def user_region_selections_main_menu(user_input, region_specific)
    region = region_specific
    if user_input == "characters"
      houses = region.houses
      characters = find_characters_from_houses(houses)
      puts "\nHere are the characters from #{region.name}:"
      show_characters(characters)
      puts "\n"
      continue_with_region(region)
    elsif user_input == "houses"
      houses = region.houses
      puts "\nHere are the houses located in #{region.name}:"
      show_allegiances(houses)
      puts "\n"
      continue_with_region(region)
    elsif user_input == 'region menu'
      regions_menu
    elsif user_input == 'main menu'
      main_menu_run
    else
      puts "\nThat's not one of the choices. Please try again."
      region_specifics_menu(region)
    end
  end

  def region_specifics_menu(region)
    region_specific = region
    user_input = region_specifics_menu_options

    if user_input == "region menu"
      regions_menu
    elsif user_input == "main menu"
      main_menu_run
    elsif user_input == "exit"
      system("clear")
      good_bye
    else
      user_region_selections_main_menu(user_input, region_specific)
    end
  end

  def region_specific_run
    region = search_region_options
    if region
      puts "\nYou are now searching for #{region.name}"
      region_specifics_menu(region)
    end
  end

end
