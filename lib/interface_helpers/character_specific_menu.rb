module CharacterSpecificMenu

  def user_character_selection
    pre_find_character
    character_choice = gets.chomp
    character = find_character(character_choice)
  end

  def search_character_options
    puts "\nDo you know which character you would like to search? Put 'Y' or 'N'."
    user_input = gets.downcase.chomp
    if user_input == 'y'
      puts "\nPlease type character name to search:"
      character_choice = gets.chomp
      character = find_character(character_choice)
      character
    elsif user_input == 'n'
      puts "\nWould you like to see a full list of characters to select from, or search by first letter? Put 'All' or 'First':"
      user_search = gets.downcase.chomp
      if user_search == 'all'
        character = user_character_selection
        character
      elsif user_search == 'first'
        character = user_character_selection
        character
      else
        puts "\nThat is not an option. Going back to the character menu."
        characters_menu
      end
    else
      puts "\nThat is not an option. Going back to the character menu."
      characters_menu
    end
  end


  def character_specifics_menu_options
    puts "\nSEARCH CHARACTER MENU".colorize(:blue).underline
    puts "Choose from one of the following categories to proceed:"
    puts "     Gender".colorize(:blue) + " - find gender of a specific character."
    puts "     Birth".colorize(:blue) + " - find birth year of a specific character."
    puts "     Death".colorize(:blue) + " - find death year of a specific character."
    puts "     Alive".colorize(:blue) + " - find out if a specific character is alive."
    puts "     Aliases".colorize(:blue) + " - find all known aliases of a specific character."
    puts "     Allegiances".colorize(:blue) + " - see where a specific character's allegiances lie."
    puts "     Books".colorize(:blue) + " - see which books a specific character appears in."
    puts "     TV".colorize(:blue) + " - see which season of GoT TV show a specific character appears in."
    puts "     Actor".colorize(:blue) + " - find the name of the actor portraying a specific character."
    puts "     Character Menu".colorize(:blue) + " - back to the character menu."
    puts "     Main Menu".colorize(:blue) + " - back to the main menu."
    puts "\nPlease make a selection:"
    user_input = gets.downcase.chomp
  end

  def continue_with_character(character)
    puts "\nWould you like to continue searching #{character.name}? Please type 'Y' or 'N'."
    user_input = gets.downcase.chomp
    if user_input == 'y'
      new_user_input = character_specifics_menu_options
      user_character_selections_main_options(new_user_input, character)
    elsif user_input == 'n'
      puts "\nWould you like to search another character? Please type 'Y', or 'N'?"
      user_input = gets.downcase.chomp
      if user_input == 'y'
        character_specific_run
      elsif user_input == 'n'
        puts "\nGreat! Going back to character's main menu."
        characters_menu
      else
        puts "\nThat's not an option. Going back to character's main menu."
        characters_menu
      end
    else
      puts "\nThat's not an option. Going back to character's main menu."
      characters_menu
    end
  end

  def user_character_selections_main_options(user_input, character_specific)
    character = character_specific
    if user_input == "gender"
      puts "\n#{character.name} currently identifies as #{character.gender}."
      puts "\n"
      continue_with_character(character)
    elsif user_input == "birth"
      if character.birth_date == "<Unknown>"
        puts "\n#{character.name}'s birth date is unknown."
        puts "\n"
      else
        puts "\n#{character.name} was born #{character.birth_date}."
        puts "\n"
      end
      continue_with_character(character)
    elsif user_input == "death"
      if character.death_date == "<Alive or Unknown>"
        puts "\n#{character.name}'s death date is unknown."
        puts "\n"
      else
        puts "\n#{character.name} died #{character.death_date}"
        puts "\n"
      end
      continue_with_character(character)
    elsif user_input == "alive"
      if character.death_date == "<Alive or Unknown>"
        puts "\n#{character.name} is currently alive or assumed to be alive."
        puts "\n"
      else
        puts "\n#{character.name} died #{character.death_date}."
        puts "\n"
      end
      continue_with_character(character)
    elsif user_input == "aliases"
      if character.aliases == "<None>"
        puts "\n#{character.name} has no known aliases."
        puts "\n"
      else
        puts "\n#{character.name} has also been known as #{character.aliases}."
        puts "\n"
      end
      continue_with_character(character)
    elsif user_input == "allegiances"
      houses = character.houses
      if houses.empty?
        puts "\nThere are no known allegiances for #{character.name}."
      else
        puts "\nHere are the house allegiances #{character.name} is a part of:"
        show_allegiances(houses)
        puts "\n"
      end
      continue_with_character(character)
    elsif user_input == "books"
      books = character.books
      puts "\nHere are the books that #{character.name} appears in:"
      show_books(books)
      puts "\n"
      continue_with_character(character)
    elsif user_input == "tv"
      seasons = character.seasons
      if character.seasons.empty?
        puts "\n#{character.name} does not appear on the GoT Show."
      else
        puts "\nHere are the seasons that #{character.name} appears in:"
        show_seasons(seasons)
        puts "\n"
      end
      continue_with_character(character)
    elsif user_input == "actor"
      if character.actor == "<Not in show>"
        puts "\n#{character.name} currently does not appear on the GoT Show."
        puts "\n"
      elsif
        puts "\n#{character.name} is/was played by #{character.actor}."
        puts "\n"
      end
      continue_with_character(character)
    elsif user_input == 'character menu'
      characters_menu
    elsif user_input == 'main menu'
      main_menu_run
    else
      puts "\nThat's not one of the choices. Please try again."
      character_specifics_menu(character)
    end
  end

  def character_specifics_menu(character)
    character_specific = character
    user_input = character_specifics_menu_options

    if user_input == "character menu"
      characters_menu
    elsif user_input == "main menu"
      main_menu_run
    elsif user_input == "exit"
      system("clear")
      good_bye
    else
      user_character_selections_main_options(user_input, character_specific)
    end
  end

  def character_specific_run
    character = search_character_options
    puts "\nYou are now searching for #{character.name}"
    character_specifics_menu(character)
  end
end

##Instead of taking user to a new menu, call a method that asks for user input if they want to continue
##Using the ternary operator, we can operate on the return value from this method and proceed from there
## e.g. continue_with_character(character) ? user_character_selections_main_options : return
