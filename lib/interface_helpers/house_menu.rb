module HouseMenu

  def houses_menu_options
    puts "\n\nChoose from one of the following categories to proceed:"
    puts "     List All Houses".colorize(:color => :green) + " - explore the houses of the GoT Universe."
    puts "     List House's Characters".colorize(:color => :green) + " - see who belongs to what house."
    puts "     List Character Allegiances".colorize(:color => :green) + " - see which characters hold allegiances to a specific house."
    puts "     List House's Location".colorize(:color => :green) + " - see what region a house is located."
    puts "     Main Menu".colorize(:color => :green) + " - back to the main menu."
    puts "\nPlease make a selection:"
    input = gets.downcase.chomp
  end

  def houses_menu
    input = houses_menu_options
    if input == "list all houses"
      puts "\n"
      puts all_houses
      puts "\n"
      houses_menu
    elsif input == "list house's characters"
      pre_find_house
      input = gets.chomp
      house = find_house(input)
      characters = find_characters(house)
      puts "\nHere are the characters with allegiances to #{house.name}:"
      show_characters(characters)
      puts "\n"
      houses_menu
    elsif input == "list character allegiances"
      pre_find_house
      input = gets.chomp
      house = find_house(input)
      characters = find_characters(house)
      puts "\nHere are the characters with allegiances to #{house.name}:"
      show_characters(characters)
      puts "\n"
      houses_menu
    elsif input == "list house's location"
      pre_find_house
      input = gets.chomp
      house = find_house(input)
      puts "\nHere is the region when you can find #{house.name}"
      puts house.region.name
      puts "\n"
      houses_menu
    elsif input == "main menu"
      main_menu_run
    elsif input == "exit"
      good_bye
    else
      puts "\nPlease don't wonder beyond the wall.".colorize(:color => :green)
      houses_menu
    end
  end

end
