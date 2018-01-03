module RegionMenu

  def geography_menu_options
    puts "\n\nChoose from one of the following categories to proceed:"
    puts "     List All Regions".colorize(:color => :cyan) + " - see all GoT regions."
    puts "     List All Houses".colorize(:color => :cyan) + " - see which houses are from a specific region."
    puts "     List All Characters".colorize(:color => :cyan) + " - see which characters are from a specific region."
    puts "     Main Menu".colorize(:color => :cyan) + " - back to the main menu."
    puts "\nPlease make a selection:"
    input = gets.downcase.chomp
  end

  def geography_menu
    input = geography_menu_options
    if input == "list all regions"
      puts "\n"
      puts all_regions
      puts "\n"
      geography_menu
    elsif input == "list all houses"
      pre_find_region
      input = gets.chomp
      region = find_region(input)
      houses = region.houses
      puts "\nHere are the houses located in #{region.name}:"
      show_allegiances(houses)
      puts "\n"
      geography_menu
    elsif input == "list all characters"
      pre_find_region
      input = gets.chomp
      region = find_region(input)
      houses = region.houses
      characters = find_characters_from_houses(houses)
      puts "\nHere are the characters from #{region.name}:"
      show_characters(characters)
      puts "\n"
      geography_menu
    elsif input == "main menu"
      main_menu_run
    elsif input == "exit"
      good_bye
    else
      puts "\nIn Dorne, blood may be fire, but we're not there kids.".colorize(:color => :cyan)
      geography_menu
    end
  end

end
