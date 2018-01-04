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
    banner = "


WWWWWWWW                           WWWWWWWW  IIIIIIIIII  NNNNNNNN        NNNNNNNN  TTTTTTTTTTTTTTTTTTTTTTT  EEEEEEEEEEEEEEEEEEEEEE  RRRRRRRRRRRRRRRRR
W::::::W                           W::::::W  I::::::::I  N:::::::N       N::::::N  T:::::::::::::::::::::T  E::::::::::::::::::::E  R::::::::::::::::R
W::::::W                           W::::::W  I::::::::I  N::::::::N      N::::::N  T:::::::::::::::::::::T  E::::::::::::::::::::E  R::::::RRRRRR:::::R
W::::::W                           W::::::W  II::::::II  N:::::::::N     N::::::N  T:::::TT:::::::TT:::::T  EE::::::EEEEEEEEE::::E  RR:::::R     R:::::R
 W:::::W           WWWWW           W:::::W     I::::I    N::::::::::N    N::::::N  TTTTTT  T:::::T  TTTTTT    E:::::E       EEEEEE    R::::R     R:::::R
  W:::::W         W:::::W         W:::::W      I::::I    N:::::::::::N   N::::::N          T:::::T            E:::::E                 R::::R     R:::::R
   W:::::W       W:::::::W       W:::::W       I::::I    N:::::::N::::N  N::::::N          T:::::T            E::::::EEEEEEEEEE       R::::RRRRRR:::::R
    W:::::W     W:::::::::W     W:::::W        I::::I    N::::::N N::::N N::::::N          T:::::T            E:::::::::::::::E       R:::::::::::::RR
     W:::::W   W:::::W:::::W   W:::::W         I::::I    N::::::N  N::::N:::::::N          T:::::T            E:::::::::::::::E       R::::RRRRRR:::::R
      W:::::W W:::::W W:::::W W:::::W          I::::I    N::::::N   N:::::::::::N          T:::::T            E::::::EEEEEEEEEE       R::::R     R:::::R
       W:::::W:::::W   W:::::W:::::W           I::::I    N::::::N    N::::::::::N          T:::::T            E:::::E                 R::::R     R:::::R
        W:::::::::W     W:::::::::W            I::::I    N::::::N     N:::::::::N          T:::::T            E:::::E       EEEEEE    R::::R     R:::::R
         W:::::::W       W:::::::W           II::::::II  N::::::N      N::::::::N        TT:::::::TT        EE::::::EEEEEEEE:::::E  RR:::::R     R:::::R
          W:::::W         W:::::W            I::::::::I  N::::::N       N:::::::N        T:::::::::T        E::::::::::::::::::::E  R::::::R     R:::::R
           W:::W           W:::W             I::::::::I  N::::::N        N::::::N        T:::::::::T        E::::::::::::::::::::E  R::::::R     R:::::R
            WWW             WWW              IIIIIIIIII  NNNNNNNN         NNNNNNN        TTTTTTTTTTT        EEEEEEEEEEEEEEEEEEEEEE  RRRRRRRR     RRRRRRR


                                                                    IIIIIIIIII     SSSSSSSSSSSSSSS
                                                                    I::::::::I   SS:::::::::::::::S
                                                                    I::::::::I  S:::::SSSSSS::::::S
                                                                    II::::::II  S:::::S     SSSSSSS
                                                                      I::::I    S:::::S
                                                                      I::::I    S:::::S
                                                                      I::::I     S::::SSSS
                                                                      I::::I      SS::::::SSSSS
                                                                      I::::I        SSS::::::::SS
                                                                      I::::I           SSSSSS::::S
                                                                      I::::I                S:::::S
                                                                      I::::I                S:::::S
                                                                    II::::::II  SSSSSSS     S:::::S
                                                                    I::::::::I  S::::::SSSSSS:::::S
                                                                    I::::::::I  S:::::::::::::::SS
                                                                    IIIIIIIIII   SSSSSSSSSSSSSSS



                  CCCCCCCCCCCCC       OOOOOOOOO       MMMMMMMM               MMMMMMMM  IIIIIIIIII  NNNNNNNN        NNNNNNNN          GGGGGGGGGGGGG
               CCC::::::::::::C     OO:::::::::OO     M:::::::M             M:::::::M  I::::::::I  N:::::::N       N::::::N       GGG::::::::::::G
             CC:::::::::::::::C   OO:::::::::::::OO   M::::::::M           M::::::::M  I::::::::I  N::::::::N      N::::::N     GG:::::::::::::::G
            C:::::CCCCCCCC::::C  O:::::::OOO:::::::O  M:::::::::M         M:::::::::M  II::::::II  N:::::::::N     N::::::N    G:::::GGGGGGGG::::G
           C:::::C       CCCCCC  O::::::O   O::::::O  M::::::::::M       M::::::::::M    I::::I    N::::::::::N    N::::::N   G:::::G       GGGGGG
          C:::::C                O:::::O     O:::::O  M:::::::::::M     M:::::::::::M    I::::I    N:::::::::::N   N::::::N  G:::::G
          C:::::C                O:::::O     O:::::O  M:::::::M::::M   M::::M:::::::M    I::::I    N:::::::N::::N  N::::::N  G:::::G
          C:::::C                O:::::O     O:::::O  M::::::M M::::M M::::M M::::::M    I::::I    N::::::N N::::N N::::::N  G:::::G    GGGGGGGGGG
          C:::::C                O:::::O     O:::::O  M::::::M  M::::M::::M  M::::::M    I::::I    N::::::N  N::::N:::::::N  G:::::G    G::::::::G
          C:::::C                O:::::O     O:::::O  M::::::M   M:::::::M   M::::::M    I::::I    N::::::N   N:::::::::::N  G:::::G    GGGGG::::G
          C:::::C                O:::::O     O:::::O  M::::::M    M:::::M    M::::::M    I::::I    N::::::N    N::::::::::N  G:::::G        G::::G
           C:::::C       CCCCCC  O::::::O   O::::::O  M::::::M     MMMMM     M::::::M    I::::I    N::::::N     N:::::::::N   G:::::G       G::::G
            C:::::CCCCCCCC::::C  O:::::::OOO:::::::O  M::::::M               M::::::M  II::::::II  N::::::N      N::::::::N    G:::::GGGGGGGG::::G
             CC:::::::::::::::C   OO:::::::::::::OO   M::::::M               M::::::M  I::::::::I  N::::::N       N:::::::N     GG:::::::::::::::G
               CCC::::::::::::C     OO:::::::::OO     M::::::M               M::::::M  I::::::::I  N::::::N        N::::::N       GGG::::::GGG:::G
                  CCCCCCCCCCCCC       OOOOOOOOO       MMMMMMMM               MMMMMMMM  IIIIIIIIII  NNNNNNNN         NNNNNNN          GGGGGG   GGGG
"

    puts banner.colorize(:blue)
    puts "\nUntil next time...".colorize(:color => :red)
    puts "\n"
  end

  def all_characters
    Character.all.collect do |character|
      if character.name != nil
        character.name
      end
    end.sort!
  end

  def all_houses
    House.all.collect {|house| house.name}.sort!
  end

  def all_books
    Book.all.collect {|book| book.name}
  end

  def all_regions
    Region.all.collect do |region|
      if region.name != nil || region.name != "None" || region.name != " "
        region.name
      end
    end.sort!
  end

  def pre_find_character
    puts "\nWhich character would you like to check out?"
    puts "\n"
    puts all_characters
    puts "\nType selection here:"
  end

  def find_character(input)
    character = Character.all.find do |character|
      character.name.downcase == input.downcase
    end
    while !character
      puts "This is not currently a character in the GoT Universe. Try again."
      puts "\n"
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
    puts "\nWhich house would you like to check out?"
    puts "\n"
    puts all_houses
    puts "\nType selection here:"
  end

  def find_house(input)
    house = House.all.find do |house|
      house.name.downcase == input.downcase
    end
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
      puts "\nWhich book would you like to check out?"
      puts "\n"
      puts all_books
      puts "\nType selection here:"
  end

  def find_book(input)
    book = Book.all.find do |book|
      book.name.downcase == input.downcase
    end
    while !book
      puts "This is not currently a book in the GoT Universe. Try Again"
      pre_find_book
      new_input = gets.chomp
      book = find_book(new_input)
    end
    book
  end

  def pre_find_region
      puts "\nWhich region would you like to check out?"
      puts "\n"
      puts all_regions
      puts "\nType selection here:"
  end

  def find_region(input)
    region = Region.all.find do |region|
      region.name.downcase == input.downcase
    end
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


  ## NOT WORKING YET ##
  def find_character_by_lord_url(input)
    character = Character.find_by(url: input)
    character.name
  end

  def find_characters_by_gender(characters, gender)
    characters.map do |character|
      if gender == character.gender
        puts character.name
      end
    end
  end

end
