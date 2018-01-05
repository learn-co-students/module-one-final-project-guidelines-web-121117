module BookFactMenu

  def book_facts_menu_options
    m = Artii::Base.new
    puts "\n"
    puts m.asciify("BOOK FACTS MENU").colorize(:magenta)
    puts "Choose from one of the following categories to proceed:"
    puts "     Most".colorize(:magenta) + " - find the GoT book with the most pages."
    puts "     Least".colorize(:magenta) + " - find the GoT book with the least pages."
    puts "     Total".colorize(:magenta) + " - find the total numbers of pages written from released GoT books."
    puts "     Newest".colorize(:magenta) + " - find the newest GoT book by release date."
    puts "     Oldest".colorize(:magenta) + " - find the oldest GoT book by release date."
    puts "     Book Menu".colorize(:magenta) + " - back to the book menu."
    puts "     Main Menu".colorize(:magenta) + " - back to the main menu."
    puts "\nPlease make a selection:"
    input = gets.downcase.chomp
  end

  def book_facts_menu
    input = book_facts_menu_options
    if input == "most"
      books = Book.all
      sorted_books = sort_books_by_page_number(books)
      most_pages = sorted_books.last
      puts "\n#{most_pages.name} contains the most pages at #{most_pages.total_pages}."
      book_facts_menu
    elsif input == "least"
      books = Book.all
      sorted_books = sort_books_by_page_number(books)
      least_pages = sorted_books.first
      puts "\n#{least_pages.name} contains the least pages at #{least_pages.total_pages}."
      book_facts_menu
    elsif input == "total"
      books = Book.all
      total_arr = books_pages_to_integer(books)
      puts "\nThe total number of pages written for the GoT series currently is #{total_arr.sum}."
      book_facts_menu
    elsif input == "newest"
      books = Book.all
      sorted_books = sort_books_by_release_date(books)
      newest_book = sorted_books.last
      puts "\n#{newest_book.name} is the newest book released on #{newest_book.release_date}."
      puts "\n"
      book_facts_menu
    elsif input == "oldest"
      books = Book.all
      sorted_books = sort_books_by_release_date(books)
      newest_book = sorted_books.first
      puts "\n#{newest_book.name} is the oldest book released on #{newest_book.release_date}."
      puts "\n"
      book_facts_menu
    elsif input == "book menu"
      books_menu
    elsif input == "main menu"
      main_menu_run
    elsif input == "exit"
      system("clear")
      good_bye
    else
      puts "\n'SOMETIMES THERE IS NO HAPPY CHOICE' - Jon Snow.".colorize(:magenta)
      puts "Sending you back to the book menu.".colorize(:magenta)
      books_menu
    end
  end

end
