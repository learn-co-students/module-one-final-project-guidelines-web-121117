module BookSpecificMenu

  def user_book_selection
    pre_find_book
    book_choice = gets.chomp
    book = find_book(book_choice)
  end

  def search_book_options
    puts "\nDo you know which book you would like to search? Put 'Y' or 'N'."
    user_input = gets.downcase.chomp
    if user_input == 'y'
      puts "\nGreat! Please put in a book title or first few letters of the book's title"
      puts "and we will try to populate the closest matches for you to choose from:"
      book_choice = gets.chomp
      book = find_book(book_choice)
      book
    elsif user_input == 'n'
      puts "\nWould you like to see a full list of characters to select from? Put 'Y' or 'N':"
      user_search = gets.downcase.chomp
      if user_search == 'y'
        book = user_book_selection
        book
      elsif user_search == 'n'
        puts "\nAlright. Sending you back to the book menu."
        books_menu
      else
        puts "\nThat is not an option. Going back to the book menu."
        books_menu
      end
    else
      puts "\nThat is not an option. Going back to the book menu."
      books_menu
    end
  end

  def book_specifics_menu_options
    puts "\nSEARCH BOOK MENU".colorize(:magenta).underline
    puts "Choose from one of the following categories to proceed:"
    puts "     Characters".colorize(:magenta) + " - see which characters appear in a specific Got book."
    puts "     Pages".colorize(:magenta) + " - find the amount of pages in a specific GoT Book."
    puts "     Release".colorize(:magenta) + " - find the release date for a specific GoT Book."
    puts "     Book Menu".colorize(:magenta) + " - back to the book menu."
    puts "     Main Menu".colorize(:magenta) + " - back to the main menu."
    puts "\nPlease make a selection:"
    user_input = gets.downcase.chomp
  end

  def continue_with_book(book)
    puts "\nWould you like to continue searching #{book.name}? Please type 'Y' or 'N'."
    user_input = gets.downcase.chomp
    if user_input == 'y'
      new_user_input = book_specifics_menu_options
      user_book_selections_main_menu(new_user_input, book)
    elsif user_input == 'n'
      puts "\nWould you like to search another book? Please type 'Y', or 'N'?"
      user_input = gets.downcase.chomp
      if user_input == 'y'
        book_specific_run
      elsif user_input == 'n'
        puts "\nGreat! Going back to book main menu."
        books_menu
      else
        puts "\nThat's not an option. Going back to book main menu."
        books_menu
      end
    else
      puts "\nThat's not an option. Going back to book main menu."
      books_menu
    end
  end

  def user_book_selections_main_menu(user_input, book_specific)
    book = book_specific
    if user_input == "characters"
      characters = book.characters
      puts "\nHere are the characters in #{book.name}"
      show_characters(characters)
      puts "\n"
      continue_with_book(book)
    elsif user_input == "pages"
      puts "\n#{book.name} contains #{book.total_pages} pages."
      continue_with_book(book)
    elsif user_input == "release"
      puts "\n#{book.name} was released on #{book.release_date}."
      continue_with_book(book)
    elsif user_input == 'book menu'
      books_menu
    elsif user_input == 'main menu'
      main_menu_run
    else
      puts "\nThat's not one of the choices. Please try again."
      book_specifics_menu(house)
    end
  end

  def book_specifics_menu(book)
    book_specific = book
    user_input = book_specifics_menu_options

    if user_input == "books menu"
      books_menu
    elsif user_input == "main menu"
      main_menu_run
    elsif user_input == "exit"
      system("clear")
      good_bye
    else
      user_book_selections_main_menu(user_input, book_specific)
    end
  end

  def book_specific_run
    book = search_book_options
    puts "\nYou are now searching for #{book.name}"
    book_specifics_menu(book)
  end

end
