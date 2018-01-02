module ApiParse

  def self.find_and_parse(url)
    JSON.parse(RestClient.get(url))
  end

  def self.search_character_pages(page=1)
    JSON.parse(RestClient.get("https://anapioficeandfire.com/api/characters?page=#{page}&pageSize=50"))
  end

  def self.find_or_create_allegiances(character_hash)
    if !character["allegiances"].empty?
      character["allegiances"].each do |house_url|
        house_info = self.find_and_parse(house_url)
        new_char.houses << House.find_or_create_by(name: house_info["name"], url: house_info["url"])
      end
    end
    new_char.houses
  end

  def self.import_data
    page = 1
    while !self.search_character_pages(page).empty?
      characters = self.search_character_pages(page)
      characters.each do |character|
        new_char = Character.find_or_create_by(name: character["name"], url: character["url"])
        self.find_or_create_character_allegiances(character)
      end
      page += 1
    end
  end

end
