module ApiParse

  def self.find_and_parse(url)
    JSON.parse(RestClient.get(url))
  end

  def self.get_all_characters
    page = 1
    characters = RestClient.get("https://anapioficeandfire.com/api/characters?page=#{page}&pageSize=50")
    while !JSON.parse(characters).empty?
      page_characters = JSON.parse(characters)
      page_characters.each do |character|
        # binding.pry
        new_char = Character.find_or_create_by(name: character["name"], url: character["url"])
        if !character["allegiances"].empty?
          character["allegiances"].each do |house_url|
            # binding.pry
            house_info = self.find_and_parse(house_url)
            new_char.houses << House.find_or_create_by(name: house_info["name"], url: house_info["url"])
          end
        end
      end
    end
  end

end
