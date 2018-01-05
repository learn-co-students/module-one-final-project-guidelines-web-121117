module CharacterMenu

  def characters_menu_options
    m = Artii::Base.new
    puts "\n"
    puts m.asciify("CHARACTER MENU").colorize(:blue)
    puts "Choose from one of the following categories to proceed:"
    puts "     Characters".colorize(:blue) + " - see all characters of the GoT Universe."
    puts "     Specific".colorize(:blue) + " - search a specific character of the GoT Universe."
    puts "     Main Menu".colorize(:blue) + " - back to the main menu."
    puts "\nPlease make a selection:"
    input = gets.downcase.chomp
  end

  def characters_menu
    input = characters_menu_options
    if input == "characters"
      puts "\n"
      puts all_characters.uniq
      puts "\n"
      characters_menu
    elsif input == "specific"
      puts "\n\n'IF I STABBED THE MAD KING IN THE BELLY INSTEAD OF THE BACK, WOULD YOU ADMIRE ME MORE?' - Jaime Lannister".colorize(:blue)
      character_specific_run
    elsif input == "main menu"
      main_menu_run
    elsif input == "exit"
      system("clear")
      good_bye
    else
      puts "\nWhile a Lannister always pays his debts, please stick to the script.".colorize(:blue)
      characters_menu
    end
  end

end
