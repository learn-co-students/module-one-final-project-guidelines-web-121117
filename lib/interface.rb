require "colorize"

class Interface

  def greet
    puts "\nWelcome to the Game Of Thrones Ultimate Fan App!"
  end

# BASIC MENU OPTIONS #

  def main_menu_options
    puts "\nChoose from one of the follow categories to proceed:"
    puts "     Characters".colorize(:color => :red) + " - explore the characters of the GoT Universe."
    puts "     Houses".colorize(:color => :red) + " - explore the houses of the GoT Universe."
    puts "     Books".colorize(:color => :red) + " - learn about the GoT Books."
    puts "     Geography".colorize(:color => :red) + " - explore the regions of the GoT Universe."
    puts "     Exit".colorize(:color => :red) + " - goodbye until next time."
    puts "\nPlease make a selection:"
    input = gets.downcase.chomp
  end

  def characters_menu_options
    puts "\n\nChoose from one of the following categories to proceed:"
    puts "     List All Characters".colorize(:color => :blue) + " - explore the characters of the GoT Universe."
    puts "     List Character's Allegiances".colorize(:color => :blue) + " - see where a specific character's allegiances lie."
    puts "     List Character's Book Appearances".colorize(:color => :blue) + " - see which books a specific character appears in."
    puts "     List Character's TV Show Appearances".colorize(:color => :blue) + " - see which season a specific character appears in."
    puts "     Main Menu".colorize(:color => :blue) + " - back to the main menu."
    puts "\nPlease make a selection:"
    input = gets.downcase.chomp
  end

  def houses_menu_options
    puts "\n\nChoose from one of the following categories to proceed:"
    puts "     List All Houses".colorize(:color => :green) + " - explore the houses of the GoT Universe."
    puts "     List House's Characters".colorize(:color => :green) + " - see who belongs to what house."
    puts "     List Character Allegiances".colorize(:color => :green) + " - see which characters hold allegiances to a specific house."
    puts "     List House's Location".colorize(:color => :green) + " - see what region a house is located."
    puts "     Main Menu".colorize(:color => :green) + " - back to the main menu."
    puts "\nPlease make a selection:"
    input = gets.downcase.chomp
  end

  def books_menu_options
    puts "\n\nChoose from one of the following categories to proceed:"
    puts "     List All Books".colorize(:color => :magenta) + " - see all GoT books."
    puts "     List Characters In Book".colorize(:color => :magenta) + " - see which characters appear in a specific book."
    puts "     Main Menu".colorize(:color => :magenta) + " - back to the main menu."
    puts "\nPlease make a selection:"
    input = gets.downcase.chomp
  end

  def geography_menu_options
    puts "\n\nChoose from one of the following categories to proceed:"
    puts "     List All Regions".colorize(:color => :cyan) + " - see all GoT regions."
    puts "     List All Houses".colorize(:color => :cyan) + " - see which houses are from a specific region."
    puts "     List All Characters".colorize(:color => :cyan) + " - see which characters are from a specific region."
    puts "     Main Menu".colorize(:color => :cyan) + " - back to the main menu."
    puts "\nPlease make a selection:"
    input = gets.downcase.chomp
  end

  # ALL COLLECTION FUNCTIONS #

  def all_characters
    Character.all.collect do |character|
      if character.name != nil
        character.name
      end
    end
  end

  def all_houses
    House.all.collect {|house| house.name}
  end

  def all_books
    Book.all.collect {|book| book.name}
  end

  def all_regions
    Region.all.collect do |region|
      if region.name != nil || region.name != "None"
        region.name
      end
    end
  end

  # CHARACTER FUNCTIONS #

  def pre_find_character
    puts "\nWhich character would you like to check out?"
    puts "\n"
    puts all_characters
    puts "\nType selection here:"
  end

  def find_character(input)
    character = Character.find_by(name: input)
    if character
      character
    else
      puts "This is not currently a character in the GoT Universe. Try again."
      puts "\n"
      pre_find_character
      new_input = gets.chomp
      find_character(new_input)
    end
  end

    def find_allegiances(input)
      input.houses
    end

    def show_allegiances(houses)
      houses.map {|house| puts house.name}
    end

    def find_books(character)
      character.books
    end

    def show_books(books)
      books.map {|book| puts book.name}
    end

    def find_seasons(character)
      character.seasons
    end

    def show_seasons(seasons)
      seasons.map {|season| puts season.name}
    end

  # HOUSE FUNCTIONS #

  def pre_find_house
    puts "\nWhich house would you like to check out?"
    puts "\n"
    puts all_houses
    puts "\nType selection here:"
  end

  def find_house(input)
    house = House.find_by(name: input)
    if house
      house
    else
      puts "This is not currently a house in the GoT Universe. Try again."
      puts "\n"
      pre_find_house
      new_input = gets.chomp
      find_house(new_input)
    end
  end

  def find_characters(input)
    input.characters
  end

  def show_characters(characters)
    characters.map {|character| puts character.name}
  end

  def find_region(house)
    house.region
  end

  def show_region(regions)
    regions.map {|region| region.name}
  end

  # BOOK FUNCTIONS #

  def pre_find_book
      puts "\nWhich book would you like to check out?"
      puts "\n"
      puts all_books
      puts "\nType selection here:"
  end

  def find_book(input)
    book = Book.find_by(name: input)
    if book
      book
    else
      puts "This is not currently a book in the GoT Universe. Try Again"
      pre_find_book
      new_input = gets.chomp
      find_book(new_input)
    end
  end

  # REGION FUNCTIONS #
  def pre_find_region
      puts "\nWhich region would you like to check out?"
      puts "\n"
      puts all_regions
      puts "\nType selection here:"
  end

  def find_region(input)
    region = Region.find_by(name: input)
    if region
      region
    else
      puts "This is not currently a region in the GoT Universe. Try Again."
      pre_find_region
      new_input = gets.chomp
      find_region(new_input)
    end
  end

  def find_characters_from_houses(house_ary)
    house_ary.map do |house|
      self.find_characters(house)
    end.flatten
  end



  # RUN MENUS #

  def characters_menu
    input = characters_menu_options
    if input == "list all characters"
      puts "\n"
      puts all_characters
      puts "\n"
      characters_menu
    elsif input == "list character's allegiances"
      pre_find_character
      input = gets.chomp
      character = find_character(input)
      houses = find_allegiances(character)
      puts "\nHere are the house allegiances #{character.name} is a part of:"
      show_allegiances(houses)
      puts "\n"
      characters_menu
    elsif input == "list character's book appearances"
      pre_find_character
      input = gets.chomp
      character = find_character(input)
      books = find_books(character)
      puts "\nHere are the books that #{character.name} appears in:"
      show_books(books)
      puts "\n"
      characters_menu
    elsif input == "list character's tv show appearances"
      pre_find_character
      input = gets.chomp
      character = find_character(input)
      seasons = find_seasons(character)
      puts "\nHere are the seasons that #{character.name} appears in:"
      show_seasons(seasons)
      puts "\n"
      characters_menu
    elsif input == "main menu"
      main_menu_run
    elsif input == "exit"
      good_bye
    else
      puts "\nWhile a Lannister always pays his debts, please stick to the script.".colorize(:color => :blue)
      characters_menu
    end
  end

  def houses_menu
    input = houses_menu_options
    if input == "list all houses"
      puts "\n"
      puts all_houses
      puts "\n"
      houses_menu
    elsif input == "list house's characters"
      pre_find_house
      input = gets.chomp
      house = find_house(input)
      characters = find_characters(house)
      puts "\nHere are the characters with allegiances to #{house.name}:"
      show_characters(characters)
      puts "\n"
      houses_menu
    elsif input == "list character allegiances"
      pre_find_house
      input = gets.chomp
      house = find_house(input)
      characters = find_characters(house)
      puts "\nHere are the characters with allegiances to #{house.name}:"
      show_characters(characters)
      puts "\n"
      houses_menu
    elsif input == "list house's location"
      pre_find_house
      input = gets.chomp
      house = find_house(input)
      puts "\nHere is the region when you can find #{house.name}"
      puts house.region.name
      puts "\n"
      houses_menu
    elsif input == "main menu"
      main_menu_run
    elsif input == "exit"
      good_bye
    else
      puts "\nPlease don't wonder beyond the wall.".colorize(:color => :green)
      houses_menu
    end
  end

  def books_menu
    input = books_menu_options
    if input == "list all books"
      puts "\n"
      puts all_books
      puts "\n"
      books_menu
    elsif input == "list characters in book"
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

  def geography_menu
    input = geography_menu_options
    if input == "list all regions"
      puts "\n"
      puts all_regions
      puts "\n"
      geography_menu
    elsif input == "list all houses"
      pre_find_region
      input = gets.chomp
      region = find_region(input)
      houses = find_allegiances(region)
      puts "\nHere are the houses located in #{region.name}:"
      show_allegiances(houses)
      puts "\n"
      geography_menu
    elsif input == "list all characters"
      pre_find_region
      input = gets.chomp
      region = find_region(input)
      houses = find_allegiances(region)
      characters = find_characters_from_houses(houses)
      puts "\nHere are the characters from #{region.name}:"
      show_characters(characters)
      puts "\n"
      geography_menu
    elsif input == "main menu"
      main_menu_run
    elsif input == "exit"
      good_bye
    else
      puts "\nIn Dorne, blood may be fire, but we're not there kids.".colorize(:color => :cyan)
      geography_menu
    end
  end

  def good_bye
    puts "\nUntil next time...".colorize(:color => :red)
    puts "\n"
  end

  def main_menu_run
    input = main_menu_options

    if input == "characters"
      puts "\n\n'THE GOOD LORDS ARE DEAD, AND THE REST ARE MONSTERS.' - Brienne of Tarth".colorize(:color => :blue)
      characters_menu
    elsif input == "houses"
      puts "\n\n'I AM A WOLF AND WILL NOT BE AFRAID' - Arya Stark".colorize(:color => :green)
      houses_menu
    elsif input == "books"
      puts "\n\n'POSSIBLY SOMETHING A BIT MORE POETIC?' - Sam Tarly".colorize(:color => :magenta)
      books_menu
    elsif input == "geography"
      puts "\n\n'THEY CAN LIVE IN MY NEW WORLD, OR THEY CAN DIE IN THEIR OLD ONE' - Daenerys Targaryen".colorize(:color => :cyan)
      geography_menu
    elsif input == "manager"
      manager_menu
    elsif input == "exit"
      good_bye
    else
      puts "\nWhile Cersei would have you killed for that choice, we'll give you another chance.".colorize(:color => :red)
      main_menu_run
    end
  end
end
