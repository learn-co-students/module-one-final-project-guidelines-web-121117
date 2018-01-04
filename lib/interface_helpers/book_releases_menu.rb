module BookReleasesMenu

  def book_releases_menu_options
    puts "\nRELEASE DATE MENU".colorize(:magenta).underline
    puts "Choose from one of the following categories to proceed:"
    puts "     Release".colorize(:magenta) + " - find the release date for a specific GoT Book."
    puts "     Newest".colorize(:magenta) + " - find the newest GoT book by release date."
    puts "     Oldest".colorize(:magenta) + " - find the oldest GoT book by release date."
    puts "     Book Menu".colorize(:magenta) + " - back to the book menu."
    puts "     Main Menu".colorize(:magenta) + " - back to the main menu."
    puts "\nPlease make a selection:"
    input = gets.downcase.chomp
  end

  def book_releases_menu
    input = book_releases_menu_options
    if input == "release"
      pre_find_book
      input = gets.chomp
      book = find_book(input)
      puts "\n#{book.name} was released on #{book.release_date}."
      book_releases_menu
    elsif input == "newest"
      books = Book.all
      sorted_books = sort_books_by_release_date(books)
      newest_book = sorted_books.last
      puts "\n#{newest_book.name} is the newest book released on #{newest_book.release_date}."
      puts "\n"
      book_releases_menu
    elsif input == "oldest"
      books = Book.all
      sorted_books = sort_books_by_release_date(books)
      newest_book = sorted_books.first
      puts "\n#{newest_book.name} is the oldest book released on #{newest_book.release_date}."
      puts "\n"
      book_releases_menu
    elsif input == "book menu"
      books_menu
    elsif input == "main menu"
      main_menu_run
    elsif input == "exit"
      good_bye
    else
      puts "\nFIND QUOTE OR SOMETHING FOR HERE".colorize(:magenta)
      books_menu
    end
  end

end
