module InterfaceMethods

  def greet
    banner = "
      GGGGGGGGGGGGG           OOOOOOOOO       TTTTTTTTTTTTTTTTTTTTTTT
    GGG::::::::::::G        OO:::::::::OO     T:::::::::::::::::::::T
   GG:::::::::::::::G     OO:::::::::::::OO   T:::::::::::::::::::::T
  G:::::GGGGGGGG::::G    O:::::::OOO:::::::O  T:::::TT:::::::TT:::::T
 G:::::G       GGGGGG    O::::::O   O::::::O  TTTTTT  T:::::T  TTTTTT
G:::::G                  O:::::O     O:::::O          T:::::T
G:::::G                  O:::::O     O:::::O          T:::::T
G:::::G    GGGGGGGGGG    O:::::O     O:::::O          T:::::T
G:::::G    G::::::::G    O:::::O     O:::::O          T:::::T
G:::::G    GGGGG::::G    O:::::O     O:::::O          T:::::T
 G:::::G        G::::G   O:::::O     O:::::O          T:::::T
  G:::::G       G::::G   O::::::O   O::::::O          T:::::T
   G:::::GGGGGGGG::::G   O:::::::OOO:::::::O        TT:::::::TT
    GG:::::::::::::::G    OO:::::::::::::OO         T:::::::::T
     GGG::::::GGG:::G       OO:::::::::OO           T:::::::::T
        GGGGGG  GGGG          OOOOOOOOO             TTTTTTTTTTT
    "
    puts banner.colorize(:color => :red)
    puts "\n~~~~~~~~ Welcome to the Game Of Thrones Ultimate Fan App! ~~~~~~~~".colorize(:color => :red)
  end

  def good_bye
    b = "



           WWWWWWWW                           WWWWWWWW iiii                            tttt
           W::::::W                           W::::::Wi::::i                        ttt:::t
           W::::::W                           W::::::W iiii                         t:::::t
           W::::::W                           W::::::W                              t:::::t
            W:::::W           WWWWW           W:::::Wiiiiiiinnnn  nnnnnnnn    ttttttt:::::ttttttt        eeeeeeeeeeee    rrrrr   rrrrrrrrr
             W:::::W         W:::::W         W:::::W i:::::in:::nn::::::::nn  t:::::::::::::::::t      ee::::::::::::ee  r::::rrr:::::::::r
              W:::::W       W:::::::W       W:::::W   i::::in::::::::::::::nn t:::::::::::::::::t     e::::::eeeee:::::eer:::::::::::::::::r
               W:::::W     W:::::::::W     W:::::W    i::::inn:::::::::::::::ntttttt:::::::tttttt    e::::::e     e:::::err::::::rrrrr::::::r
                W:::::W   W:::::W:::::W   W:::::W     i::::i  n:::::nnnn:::::n      t:::::t          e:::::::eeeee::::::e r:::::r     r:::::r
                 W:::::W W:::::W W:::::W W:::::W      i::::i  n::::n    n::::n      t:::::t          e:::::::::::::::::e  r:::::r     rrrrrrr
                  W:::::W:::::W   W:::::W:::::W       i::::i  n::::n    n::::n      t:::::t          e::::::eeeeeeeeeee   r:::::r
                   W:::::::::W     W:::::::::W        i::::i  n::::n    n::::n      t:::::t    tttttte:::::::e            r:::::r
                    W:::::::W       W:::::::W        i::::::i n::::n    n::::n      t::::::tttt:::::te::::::::e           r:::::r
                     W:::::W         W:::::W         i::::::i n::::n    n::::n      tt::::::::::::::t e::::::::eeeeeeee   r:::::r
                      W:::W           W:::W          i::::::i n::::n    n::::n        tt:::::::::::tt  ee:::::::::::::e   r:::::r
                       WWW             WWW           iiiiiiii nnnnnn    nnnnnn          ttttttttttt      eeeeeeeeeeeeee   rrrrrrr


           IIIIIIIIII                              CCCCCCCCCCCCC                                           iiii
           I::::::::I                           CCC::::::::::::C                                          i::::i
           I::::::::I                         CC:::::::::::::::C                                           iiii
           II::::::II                        C:::::CCCCCCCC::::C
             I::::I      ssssssssss         C:::::C       CCCCCC   ooooooooooo      mmmmmmm    mmmmmmm   iiiiiiinnnn  nnnnnnnn       ggggggggg   ggggg
             I::::I    ss::::::::::s       C:::::C               oo:::::::::::oo  mm:::::::m  m:::::::mm i:::::in:::nn::::::::nn    g:::::::::ggg::::g
             I::::I  ss:::::::::::::s      C:::::C              o:::::::::::::::om::::::::::mm::::::::::m i::::in::::::::::::::nn  g:::::::::::::::::g
             I::::I  s::::::ssss:::::s     C:::::C              o:::::ooooo:::::om::::::::::::::::::::::m i::::inn:::::::::::::::ng::::::ggggg::::::gg
             I::::I   s:::::s  ssssss      C:::::C              o::::o     o::::om:::::mmm::::::mmm:::::m i::::i  n:::::nnnn:::::ng:::::g     g:::::g
             I::::I     s::::::s           C:::::C              o::::o     o::::om::::m   m::::m   m::::m i::::i  n::::n    n::::ng:::::g     g:::::g
             I::::I        s::::::s        C:::::C              o::::o     o::::om::::m   m::::m   m::::m i::::i  n::::n    n::::ng:::::g     g:::::g
             I::::I  ssssss   s:::::s       C:::::C       CCCCCCo::::o     o::::om::::m   m::::m   m::::m i::::i  n::::n    n::::ng::::::g    g:::::g
           II::::::IIs:::::ssss::::::s       C:::::CCCCCCCC::::Co:::::ooooo:::::om::::m   m::::m   m::::mi::::::i n::::n    n::::ng:::::::ggggg:::::g
           I::::::::Is::::::::::::::s         CC:::::::::::::::Co:::::::::::::::om::::m   m::::m   m::::mi::::::i n::::n    n::::n g::::::::::::::::g
           I::::::::I s:::::::::::ss            CCC::::::::::::C oo:::::::::::oo m::::m   m::::m   m::::mi::::::i n::::n    n::::n  gg::::::::::::::g
           IIIIIIIIII  sssssssssss                 CCCCCCCCCCCCC   ooooooooooo   mmmmmm   mmmmmm   mmmmmmiiiiiiii nnnnnn    nnnnnn    gggggggg::::::g
                                                                                                                                              g:::::g
                                                                                                                                  gggggg      g:::::g
                                                                                                                                  g:::::gg   gg:::::g
                                                                                                                                   g::::::ggg:::::::g
                                                                                                                                    gg:::::::::::::g
                                                                                                                                      ggg::::::ggg
                                                                                                                                         gggggg
"
    puts b.colorize(:blue)
  end

  def all_characters
    all_characters_arr = []
    Character.all.select do |character|
      if character.name != nil && character.name != ""
        all_characters_arr << character.name
      end
    end
    all_characters_arr.sort!
  end

  def all_houses
    House.all.collect {|house| house.name}.sort!
  end

  def all_books
    Book.all.collect {|book| book.name}
  end

  def all_books_with_info
    Book.all.each do |book|
      puts "#{book.id}. #{book.name} - total pages: #{book.total_pages}, release date: #{book.release_date}."
    end
  end

  def all_regions
    Region.all.collect do |region|
      if region.name != nil || region.name != "None" || region.name != " "
        region.name
      end
    end.sort!
  end

  def pre_find_character
    puts "\nHere are all the characters in the GoT universe:"
    puts "\n"
    puts all_characters
    puts "\nType the full name, or the first few letters of the character you are looking for here:"
  end

  def find_character(input)
    query = ["%",input,"%"].join
    characters = Character.where(["name LIKE ?", query])
    while characters.empty?
      puts "\nWe could not find the character you put in. Try again:"
      input = gets.chomp
      query = ["%",input,"%"].join
      characters = Character.where(["name LIKE ?", query])
    end
    puts "\nHere are the matches we could generate:"
    characters.each_with_index{|char, idx| puts "#{idx}.".colorize(:blue) + " #{char.name}"}
    puts "\nEnter the number of the character you are looking for:"
    response = gets.chomp.to_i
    while !(response.integer?)
      puts "\nThat did not match. Try again:"
      response = gets.chomp.to_i
    end
    character = characters[response]
    while !character
      puts "This is not currently a character in the GoT Universe. Try again."
      pre_find_character
      new_input = gets.chomp
      character = find_character(new_input)
    end
    character
  end

  def show_allegiances(houses)
    houses.map {|house| puts house.name}
  end

  def show_books(books)
    books.map {|book| puts book.name}
  end

  def show_seasons(seasons)
    seasons.map {|season| puts season.name}
  end

  def pre_find_house
    puts "\nHere are all the houses in the GoT universe:"
    puts "\n"
    puts all_houses
    puts "\nType the full name, or the first few letters of the house you are looking for here:"
  end

  def find_house(input)
    query = ["%",input,"%"].join
    houses = House.where(["name LIKE ?", query])
    while houses.empty?
      puts "\nWe could not find the house you put in. Try again:"
      input = gets.chomp
      query = ["%",input,"%"].join
      houses = House.where(["name LIKE ?", query])
    end
    puts "\nHere are the matches we could generate:"
    houses.each_with_index{|house, idx| puts "#{idx}.".colorize(:green) + " #{house.name}"}
    puts "\nEnter the number of the house you are looking for:"
    response = gets.chomp.to_i
    house = houses[response]
    while !house
      puts "This is not currently a house in the GoT Universe. Try again."
      puts "\n"
      pre_find_house
      new_input = gets.chomp
      house = find_house(new_input)
    end
    house
  end

  def show_characters(characters)
    characters.map {|character| puts character.name}
  end

  def show_region(regions)
    regions.map {|region| region.name}
  end

  def pre_find_book
      puts "\nHere are all the houses written for the GoT universe:"
      puts "\n"
      puts all_books
      puts "\nType the full name, or the first few letters of the book looking for here:"
  end

  def find_book(input)
    query = ["%",input,"%"].join
    books = Book.where(["name LIKE ?", query])
    while books.empty?
      puts "\nWe could not find the book you put in. Try again:"
      input = gets.chomp
      query = ["%",input,"%"].join
      books = Book.where(["name LIKE ?", query])
    end
    puts "\nHere are the matches we could generate:"
    books.each_with_index{|house, idx| puts "#{idx}.".colorize(:magenta) + " #{house.name}"}
    puts "\nEnter the number of the book you are looking for:"
    response = gets.chomp.to_i
    book = books[response]
    while !book
      puts "\nThis is not currently a book in the GoT Universe. Try Again"
      pre_find_book
      new_input = gets.chomp
      book = find_book(new_input)
    end
    book
  end

  def pre_find_region
      puts "\nHere are all the regions in the GoT universe:"
      puts "\n"
      puts all_regions
      puts "\nType the full name, or the first few letters of the region looking for here:"
  end

  def find_region(input)
    query = ["%",input,"%"].join
    regions = Region.where(["name LIKE ?", query])
    while regions.empty?
      puts "\nWe could not find the region you put in. Try again:"
      input = gets.chomp
      query = ["%",input,"%"].join
      regions = Region.where(["name LIKE ?", query])
    end
    puts "\nHere are the matches we could generate:"
    regions.each_with_index{|house, idx| puts "#{idx}.".colorize(:cyan) + " #{house.name}"}
    puts "\nEnter the number of the book you are looking for:"
    response = gets.chomp.to_i
    region = regions[response]
    while region == nil
      puts "This is not currently a region in the GoT Universe. Try Again."
      pre_find_region
      input = gets.chomp
      region = find_region(input)
    end
    region
  end

  def find_characters_from_houses(house_ary)
    house_ary.map do |house|
      house.characters
    end.flatten
  end

  def find_characters_by_gender(characters, input)
    gender = characters.select do |character|
      character.gender.downcase == input.downcase
    end.sort_by{|character| character.name}
    if gender.empty?
      puts "\nThere is no known character with that gender."
    else
      gender.each do |character|
        puts character.name
      end
    end
  end

  def sort_books_by_page_number(books)
    books.sort_by do |book|
      book.total_pages.to_i
    end
  end

  def sort_books_by_release_date(books)
    books.sort_by do |book|
      book.release_date.to_date
    end
  end

  def books_pages_to_integer(books_arr)
    books_arr.map do |book|
      book.total_pages.to_i
    end
  end

  def help_prompt
    puts "\nWe are sorry to hear that the app is giving you problems. Most likely"
    puts "it is due to the database not being downloaded properly. To fix this problem"
    puts "please delete your development.db file located in the db folder of this program."
    puts "Once deleted, you can rerun the program which will download a new database for you."
    puts "\n"
  end

end
