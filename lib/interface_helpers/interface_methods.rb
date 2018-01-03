module InterfaceMethods

  def greet
    puts "\nWelcome to the Game Of Thrones Ultimate Fan App!"
  end

  def good_bye
    puts "\nUntil next time...".colorize(:color => :red)
    puts "\n"
  end

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
      find_character(new_input)
    end
    character
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

end
