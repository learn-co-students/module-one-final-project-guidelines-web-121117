module ApiParse

  def self.find_and_parse(url)
    JSON.parse(RestClient.get(url))
  end

  def self.search_character_page(page=1)
    JSON.parse(RestClient.get("https://anapioficeandfire.com/api/characters?page=#{page}&pageSize=50"))
  end

  def self.get_all_characters
    page = 1
    while !self.search_character_page.empty?
      page_characters = self.search_character_page(page)
      binding.pry
      page_characters.each do |character|
        new_char = Character.find_or_create_by(name: character["name"], url: character["url"])
        if !character["allegiances"].empty?
          character["allegiances"].each do |house_url|
            house_info = self.find_and_parse(house_url)
            new_char.houses << House.find_or_create_by(name: house_info["name"], url: house_info["url"])
          end
        end
      end
      page += 1
    end
  end

end
