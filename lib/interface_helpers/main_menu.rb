module MainMenu

  def main_menu_options
    puts "\n\nMAIN MENU".colorize(:red).underline
    puts "Choose from one of the follow categories to proceed:"
    puts "     Characters".colorize(:red) + " - explore the characters of the GoT Universe."
    puts "     Houses".colorize(:red) + " - explore the houses of the GoT Universe."
    puts "     Books".colorize(:red) + " - learn about the GoT Books."
    puts "     Regions".colorize(:red) + " - explore the regions of the GoT Universe."
    puts "     Exit".colorize(:red) + " - goodbye until next time."
    puts "\nPlease make a selection:"
    input = gets.downcase.chomp
  end

  def main_menu_run
    input = main_menu_options

    if input == "characters"
      puts "\n\n'THE GOOD LORDS ARE DEAD, AND THE REST ARE MONSTERS.' - Brienne of Tarth".colorize(:blue)
      characters_menu
    elsif input == "houses"
      puts "\n\n'I AM A WOLF AND WILL NOT BE AFRAID' - Arya Stark".colorize(:green)
      houses_menu
    elsif input == "books"
      puts "\n\n'POSSIBLY SOMETHING A BIT MORE POETIC?' - Sam Tarly".colorize(:magenta)
      books_menu
    elsif input == "regions"
      puts "\n\n'THEY CAN LIVE IN MY NEW WORLD, OR THEY CAN DIE IN THEIR OLD ONE' - Daenerys Targaryen".colorize(:cyan)
      regions_menu
    elsif input == "manager"
      manager_menu
    elsif input == "exit"
      system("clear")
      good_bye
    else
      puts "\nWhile Cersei would have you killed for that choice, we'll give you another chance.".colorize(:red)
      main_menu_run
    end
  end

end
