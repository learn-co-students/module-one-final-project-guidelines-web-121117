module BookMenu

  def books_menu_options
    puts "\n\nChoose from one of the following categories to proceed:"
    puts "     Books".colorize(:color => :magenta) + " - see all GoT books."
    puts "     Characters".colorize(:color => :magenta) + " - see which characters appear in a specific book."
    puts "     Main Menu".colorize(:color => :magenta) + " - back to the main menu."
    puts "\nPlease make a selection:"
    input = gets.downcase.chomp
  end

  def books_menu
    input = books_menu_options
    if input == "books"
      puts "\n"
      puts all_books
      puts "\n"
      books_menu
    elsif input == "characters"
      pre_find_book
      input = gets.chomp
      book = find_book(input)
      characters = find_characters(book)
      puts "\nHere are the characters in #{book.name}"
      show_characters(characters)
      puts "\n"
      books_menu
    elsif input == "main menu"
      main_menu_run
    elsif input == "exit"
      good_bye
    else
      puts "\nI'm not writing 'A Chronicle of the Wars Following the Death of
       King Robert I,' so it can sit on the shelf unread.".colorize(:color => :magenta)
      books_menu
    end
  end

end
