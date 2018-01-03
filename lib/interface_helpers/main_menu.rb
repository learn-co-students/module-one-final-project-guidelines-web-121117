module MainMenu

  def main_menu_options
    puts "\nChoose from one of the follow categories to proceed:"
    puts "     Characters".colorize(:color => :red) + " - explore the characters of the GoT Universe."
    puts "     Houses".colorize(:color => :red) + " - explore the houses of the GoT Universe."
    puts "     Books".colorize(:color => :red) + " - learn about the GoT Books."
    puts "     Geography".colorize(:color => :red) + " - explore the regions of the GoT Universe."
    puts "     Exit".colorize(:color => :red) + " - goodbye until next time."
    puts "\nPlease make a selection:"
    input = gets.downcase.chomp
  end

  def main_menu_run
    input = main_menu_options

    if input == "characters"
      puts "\n\n'THE GOOD LORDS ARE DEAD, AND THE REST ARE MONSTERS.' - Brienne of Tarth".colorize(:color => :blue)
      characters_menu
    elsif input == "houses"
      puts "\n\n'I AM A WOLF AND WILL NOT BE AFRAID' - Arya Stark".colorize(:color => :green)
      houses_menu
    elsif input == "books"
      puts "\n\n'POSSIBLY SOMETHING A BIT MORE POETIC?' - Sam Tarly".colorize(:color => :magenta)
      books_menu
    elsif input == "geography"
      puts "\n\n'THEY CAN LIVE IN MY NEW WORLD, OR THEY CAN DIE IN THEIR OLD ONE' - Daenerys Targaryen".colorize(:color => :cyan)
      geography_menu
    elsif input == "manager"
      manager_menu
    elsif input == "exit"
      good_bye
    else
      puts "\nWhile Cersei would have you killed for that choice, we'll give you another chance.".colorize(:color => :red)
      main_menu_run
    end
  end

end
