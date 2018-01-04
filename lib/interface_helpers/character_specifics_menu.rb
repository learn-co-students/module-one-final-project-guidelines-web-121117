module CharacterSpecificMenu

  def user_character_selection
    pre_find_character
    character_choice = gets.chomp
    character = find_character(character_choice)
  end

  def character_specifics_menu_options
    puts "\nSEARCH CHARACTER MENU".colorize(:blue).underline
    puts "Choose from one of the following categories to proceed:"
    puts "     Gender".colorize(:blue) + " - find gender of a specific character."
    puts "     Birth".colorize(:blue) + " - find birth year of a specific character."
    puts "     Death".colorize(:blue) + " - find death year of a specific character."
    puts "     Alive".colorize(:blue) + " - find out if a specific character is alive."
    puts "     Aliases".colorize(:blue) + " - find all known aliases of a specific character."
    puts "     Actor".colorize(:blue) + " - find the name of the actor portraying a specific character."
    puts "     Character Menu".colorize(:blue) + " - back to the book menu."
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
    elsif user_input == "actor"
      if character.actor == "<Not in show>"
        puts "\n#{character.name} currently does not appear on the GoT Show."
        puts "\n"
      elsif
        puts "\n#{character.name} is/was played by #{character.actor}."
        puts "\n"
      end
      continue_with_character(character)
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
      good_bye
    else
      user_character_selections_main_options(user_input, character_specific)
    end
  end

  def character_specific_run
    character = user_character_selection
    puts "\nYou are now searching for #{character.name}"
    character_specifics_menu(character)
  end
end

##Instead of taking user to a new menu, call a method that asks for user input if they want to continue
##Using the ternary operator, we can operate on the return value from this method and proceed from there
## e.g. continue_with_character(character) ? user_character_selections_main_options : return
