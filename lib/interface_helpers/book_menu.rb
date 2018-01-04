module BookMenu

  def books_menu_options
    puts "\nBOOK MENU".colorize(:magenta).underline
    puts "Choose from one of the following categories to proceed:"
    puts "     Books".colorize(:magenta) + " - see all GoT books."
    puts "     Characters".colorize(:magenta) + " - see which characters appear in a specific book."
    puts "     Pages".colorize(:magenta) + " - got to pages menu."
    puts "     Release".colorize(:magenta) + " - go to release dates menu."
    puts "     Main Menu".colorize(:magenta) + " - back to the main menu."
    puts "\nPlease make a selection:"
    input = gets.downcase.chomp
  end

  def books_menu
    input = books_menu_options
    if input == "books"
      puts "\n"
      all_books_with_info.order(:release_date)
      puts "\n"
      books_menu
    elsif input == "characters"
      pre_find_book
      input = gets.chomp
      book = find_book(input)
      characters = book.characters
      puts "\nHere are the characters in #{book.name}"
      show_characters(characters)
      puts "\n"
      books_menu
    elsif input == "pages"
      puts "\n\n'FIND QUOTE".colorize(:magenta)
      book_pages_menu
    elsif input == "release"
      puts "\n\n'FIND QUOTE".colorize(:magenta)
      book_releases_menu
    elsif input == "main menu"
      main_menu_run
    elsif input == "exit"
      good_bye
    else
      puts "\nI'm not writing 'A Chronicle of the Wars Following the Death of
       King Robert I,' so it can sit on the shelf unread.".colorize(:magenta)
      books_menu
    end
  end

end
