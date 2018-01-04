module BookPagesMenu

  def book_pages_menu_options
    puts "\nPAGE MENU".colorize(:magenta).underline
    puts "Choose from one of the following categories to proceed:"
    puts "     Book".colorize(:magenta) + " - find the amount of pages in a specific GoT Book."
    puts "     Most".colorize(:magenta) + " - find the GoT book with the most pages."
    puts "     Least".colorize(:magenta) + " - find the GoT book with the least pages."
    puts "     Total".colorize(:magenta) + " - find the total numbers of pages written from released GoT books."
    puts "     Book Menu".colorize(:magenta) + " - back to the book menu."
    puts "     Main Menu".colorize(:magenta) + " - back to the main menu."
    puts "\nPlease make a selection:"
    input = gets.downcase.chomp
  end

  def book_pages_menu
    input = book_pages_menu_options
    if input == "book"
      pre_find_book
      input = gets.chomp
      book = find_book(input)
      puts "\n#{book.name} contains #{book.total_pages} pages."
      book_pages_menu
    elsif input == "most"
      books = Book.all
      sorted_books = sort_books_by_page_number(books)
      most_pages = sorted_books.last
      puts "\n#{most_pages.name} contains the most pages at #{most_pages.total_pages}."
      book_pages_menu
    elsif input == "least"
      books = Book.all
      sorted_books = sort_books_by_page_number(books)
      least_pages = sorted_books.first
      puts "\n#{least_pages.name} contains the least pages at #{least_pages.total_pages}."
      book_pages_menu
    elsif input == "total"
      books = Book.all
      total_arr = books_pages_to_integer(books)
      puts "\nThe total number of pages written for the GoT series currently is #{total_arr.sum}."
      book_pages_menu
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
