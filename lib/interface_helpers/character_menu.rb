module CharacterMenu

  def characters_menu_options
    puts "\nCHARACTER MENU".colorize(:blue).underline
    puts "Choose from one of the following categories to proceed:"
    puts "     Characters".colorize(:blue) + " - see all characters of the GoT Universe."
    puts "     Specific".colorize(:blue) + " - see specific traits for a character of the GoT Universe."
    puts "     Allegiances".colorize(:blue) + " - see where a specific character's allegiances lie."
    puts "     Books".colorize(:blue) + " - see which books a specific character appears in."
    puts "     TV".colorize(:blue) + " - see which season of GoT TV show a specific character appears in."
    puts "     Main Menu".colorize(:blue) + " - back to the main menu."
    puts "\nPlease make a selection:"
    input = gets.downcase.chomp
  end

  def characters_menu
    input = characters_menu_options
    if input == "characters"
      puts "\n"
      puts all_characters
      puts "\n"
      characters_menu
    elsif input == "specific"
      puts "\n\n'FIND QUOTE".colorize(:blue)
      character_specific_run
    elsif input == "allegiances"
      pre_find_character
      input = gets.chomp
      character = find_character(input)
      houses = character.houses
      puts "\nHere are the house allegiances #{character.name} is a part of:"
      show_allegiances(houses)
      puts "\n"
      characters_menu
    elsif input == "books"
      pre_find_character
      input = gets.chomp
      character = find_character(input)
      books = character.books
      puts "\nHere are the books that #{character.name} appears in:"
      show_books(books)
      puts "\n"
      characters_menu
    elsif input == "tv"
      pre_find_character
      input = gets.chomp
      character = find_character(input)
      seasons = character.seasons
      puts "\nHere are the seasons that #{character.name} appears in:"
      show_seasons(seasons)
      puts "\n"
      characters_menu
    elsif input == "main menu"
      main_menu_run
    elsif input == "exit"
      good_bye
    else
      puts "\nWhile a Lannister always pays his debts, please stick to the script.".colorize(:blue)
      characters_menu
    end
  end

end
