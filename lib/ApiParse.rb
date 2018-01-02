module ApiParse

  def self.find_and_parse(url)
    JSON.parse(RestClient.get(url))
  end

  def self.search_character_pages(page=1)
    JSON.parse(RestClient.get("https://anapioficeandfire.com/api/characters?page=#{page}&pageSize=50"))
  end

  def self.find_or_create_allegiances(character_hash)
    char = Character.find_or_create_by(name: character_hash["name"], url: character_hash["url"])
    if !character_hash["allegiances"].empty?
      character_hash["allegiances"].each do |house_url|
        house_info = self.find_and_parse(house_url)
        char.houses << House.find_or_create_by(name: house_info["name"], url: house_info["url"])
      end
    end
    char
  end

  def self.find_or_create_character_books(character_hash)
    char = Character.find_or_create_by(name: character_hash["name"], url: character_hash["url"])
    if !character_hash["books"].empty?
      character_hash["books"].each do |book_url|
        book_info = self.find_and_parse(book_url)
        char.books << Book.find_or_create_by(name: book_info["name"], url: book_info["url"])
      end
    end
    char
  end

  def self.find_or_create_character_seasons(character_hash)
    char = Character.find_or_create_by(name: character_hash["name"], url: character_hash["url"])
    if !character_hash["tvSeries"].empty?
      character_hash["tvSeries"].each do |season|
        char.seasons << Season.find_or_create_by(name: season)
      end
    end
    char
  end

  def self.import_data
    page = 1
    while !self.search_character_pages(page).empty?
      characters = self.search_character_pages(page)
      characters.each do |character|
        self.find_or_create_allegiances(character)
        self.find_or_create_character_books(character)
        self.find_or_create_character_seasons(character)
      end
      page += 1
    end
  end

end
