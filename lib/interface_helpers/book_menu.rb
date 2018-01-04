module BookMenu

  def books_menu_options
    puts "\nBOOK MENU".colorize(:magenta).underline
    puts "Choose from one of the following categories to proceed:"
    puts "     Books".colorize(:magenta) + " - see all GoT books."
    puts "     Specific".colorize(:magenta) + " - search a specific book of the GoT Universe."
    puts "     Facts".colorize(:magenta) + " - search a specific book of the GoT Universe."
    puts "     Main Menu".colorize(:magenta) + " - back to the main menu."
    puts "\nPlease make a selection:"
    input = gets.downcase.chomp
  end

  def books_menu
    input = books_menu_options
    if input == "books"
      puts "\n"
      all_books_with_info
      puts "\n"
      books_menu
    elsif input == "specific"
      puts "\n\n'A MIND NEEDS BOOKS LIKE A SWORD NEEDS A WHETSTONE.' - Tyrion Lannister".colorize(:magenta)
      book_specific_run
    elsif input == "facts"
      puts "\n\n'HOLD THE DOOR!' - Hodor".colorize(:magenta)
      book_facts_menu
    elsif input == "main menu"
      main_menu_run
    elsif input == "exit"
      system("clear")
      good_bye
    else
      puts "\nI'm not writing 'A Chronicle of the Wars Following the Death of
       King Robert I,' so it can sit on the shelf unread.".colorize(:magenta)
      books_menu
    end
  end

end
