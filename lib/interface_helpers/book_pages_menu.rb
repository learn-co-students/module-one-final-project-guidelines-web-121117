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
      books.each do |book|
        book.total_pages
      end
      most_pages = books.sort_by(book.total_pages).last
      puts "\n#{book.name} contains the most pages at #{book.most_pages}"
    elsif input == "least"
      books = Book.all
      least_pages = books.total_pages.first
      puts "\n#{book.name} contains the most pages at #{book.least_pages}"
    elsif input == "total"
      total_pages = []
      books = Book.all
      books.each do |book|
        total = book.total_pages.to_i
        total_pages << total
      end
      final_number = total_pages.sum
      puts "\nThe total pages written for the GoT series currently is #{final_number}."
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
