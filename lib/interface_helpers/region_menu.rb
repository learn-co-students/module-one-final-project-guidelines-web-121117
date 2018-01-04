module RegionMenu

  def region_menu_options
    puts "\nREGION MENU".colorize(:cyan).underline
    puts "Choose from one of the following categories to proceed:"
    puts "     Regions".colorize(:cyan) + " - see all regions in the GoT universe."
    puts "     Houses".colorize(:cyan) + " - see which houses are from a specific region."
    puts "     Characters".colorize(:cyan) + " - see which characters are from a specific region."
    puts "     Main Menu".colorize(:cyan) + " - back to the main menu."
    puts "\nPlease make a selection:"
    input = gets.downcase.chomp
  end

  def region_menu
    input = region_menu_options
    if input == "regions"
      puts all_regions
      puts "\n"
      region_menu
    elsif input == "houses"
      pre_find_region
      input = gets.chomp
      region = find_region(input)
      houses = region.houses
      puts "\nHere are the houses located in #{region.name}:"
      show_allegiances(houses)
      puts "\n"
      region_menu
    elsif input == "characters"
      pre_find_region
      input = gets.chomp
      region = find_region(input)
      houses = region.houses
      characters = find_characters_from_houses(houses)
      puts "\nHere are the characters from #{region.name}:"
      show_characters(characters)
      puts "\n"
      region_menu
    elsif input == "main menu"
      main_menu_run
    elsif input == "exit"
      good_bye
    else
      puts "\nIn Dorne, blood may be fire, but we're not there kids.".colorize(:cyan)
      region_menu
    end
  end

end
