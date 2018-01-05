module HouseMenu

  def houses_menu_options
    m = Artii::Base.new
    puts "\n"
    puts m.asciify("HOUSE MENU").colorize(:green)
    puts "Choose from one of the following categories to proceed:"
    puts "     Houses".colorize(:green) + " - see all houses of the GoT Universe."
    puts "     Specific".colorize(:green) + " - search a specific house of the GoT Universe."
    puts "     Main Menu".colorize(:green) + " - back to the main menu."
    puts "\nPlease make a selection:"
    input = gets.downcase.chomp
  end

  def houses_menu
    input = houses_menu_options
    if input == "houses"
      puts "\n"
      puts all_houses
      puts "\n"
      houses_menu
    elsif input == "specific"
      puts "\n\n'IF I STABBED THE MAD KING IN THE BELLY INSTEAD OF THE BACK, WOULD YOU ADMIRE ME MORE?' - Jaime Lannister".colorize(:green)
      house_specific_run
    elsif input == "main menu"
      main_menu_run
    elsif input == "exit"
      system("clear")
      good_bye
    else
      puts "\nPlease don't wonder beyond the wall.".colorize(:green)
      houses_menu
    end
  end

end
