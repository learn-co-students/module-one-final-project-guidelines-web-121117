module ApiParse

  def self.find_and_parse(url)
    JSON.parse(RestClient.get(url))
  end

  def self.search_pages(target, page=1)
    JSON.parse(RestClient.get("https://anapioficeandfire.com/api/#{target}?page=#{page}&pageSize=50"))
  end


  def self.find_or_create_character_books(character, character_hash)
    if !character_hash["books"].empty?
      character_hash["books"].each do |book_url|
        book_info = self.find_and_parse(book_url)
        character.books << Book.find_or_create_by(name: book_info["name"], url: book_info["url"])
      end
      character_hash["povBooks"].each do |book_url|
        book_info = self.find_and_parse(book_url)
        character.books << Book.find_or_create_by(name: book_info["name"], url: book_info["url"])
      end
    end
  end

  def self.find_or_create_character_seasons(character, character_hash)
    if !character_hash["tvSeries"].empty?
      character_hash["tvSeries"].each do |season|
        character.seasons << Season.find_or_create_by(name: season)
      end
    end
  end

  def self.import_characters_books_seasons
    page = 1
    while !self.search_pages("characters", page).empty?
      characters = self.search_pages("characters", page)
      characters.each do |character_hash|
        new_char = Character.find_or_create_by(name: character_hash["name"], url: character_hash["url"])
        self.find_or_create_character_books(new_char, character_hash)
        self.find_or_create_character_seasons(new_char, character_hash)
      end
      page += 1
    end
  end

  def self.add_characters_to_house(house, house_hash)
    house_hash["swornMembers"].each do |character_url|
      house.characters << Character.find_by(url: character_url)
    end
  end

  def self.import_houses_regions
    page = 1
    while !self.search_pages("houses", page).empty?
      houses = self.search_pages("houses", page)
      houses.each do |house|
        new_house = House.find_or_create_by(name: house["name"], url: house["url"])
        Region.find_or_create_by(name: house["region"]).houses << new_house
        self.add_characters_to_house(new_house, house)
      end
      page += 1
    end
  end

  def self.import_data
    self.import_characters_books_seasons
    self.import_houses_regions
  end

end
