module ApiParse

  def self.find_and_parse(url)
    JSON.parse(RestClient.get(url))
  end

  def self.search_pages(target, page=1)
    self.find_and_parse("https://anapioficeandfire.com/api/#{target}?page=#{page}&pageSize=50")
  end

  def self.populate_character_attributes(character, character_hash)
    character.gender = character_hash["gender"]
    character_hash["born"].empty? ? character.birth_date = "<Unknown>" : character.birth_date = character_hash["born"]
    character_hash["died"].empty? ? character.death_date = "<Alive or Unknown>" : character.death_date = character_hash["died"]
    character_hash["aliases"][0].empty? ? character.aliases = "<None>" : character.aliases = character_hash["aliases"].join(", ")
    character_hash["playedBy"][0].empty? ? character.actor = "<Not in show>" : character.actor = character_hash["playedBy"][0]
    character.save
  end

  def self.find_or_create_character_books(character, character_hash)
    character_hash["books"].each do |book_url|
      book_info = self.find_and_parse(book_url)
      character.books << Book.find_or_create_by(name: book_info["name"], url: book_info["url"], total_pages: book_info["numberOfPages"], release_date: book_info["released"].slice(0..9))
    end
    character_hash["povBooks"].each do |book_url|
      book_info = self.find_and_parse(book_url)
      character.books << Book.find_or_create_by(name: book_info["name"], url: book_info["url"], total_pages: book_info["numberOfPages"], release_date: book_info["released"].slice(0..9))
    end
  end

  def self.find_or_create_character_seasons(character, character_hash)
    character_hash["tvSeries"].each do |season|
      character.seasons << Season.find_or_create_by(name: season)
    end
  end

  def self.import_characters_books_seasons
    page = 1
    while !self.search_pages("characters", page).empty?
      characters = self.search_pages("characters", page)
      characters.each do |character_hash|
        character = Character.find_or_create_by(name: character_hash["name"], url: character_hash["url"])
        self.populate_character_attributes(character, character_hash)
        self.find_or_create_character_books(character, character_hash)
        self.find_or_create_character_seasons(character, character_hash)
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
      houses.each do |house_hash|
        house_lord = Character.find_by(url: house_hash["currentLord"])
        house = House.find_or_create_by(name: house_hash["name"], url: house_hash["url"], current_lord: house_lord)
        house.current_lord = house_lord
        house.save
        house_hash["Region"] == "" ? Region.find_or_create_by(name: "None").houses << house : Region.find_or_create_by(name: house_hash["region"]).houses << house
        self.add_characters_to_house(house, house_hash)
      end
      page += 1
    end
  end

  def self.import_data
    self.import_characters_books_seasons
    self.import_houses_regions
  end

end
