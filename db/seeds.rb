

module ApiParse

  def self.get_all_characters
    page = 1
    characters = RestClient.get("https://anapioficeandfire.com/api/characters?page=#{page}&pageSize=50")
    while !JSON.parse(characters).empty?
      page_characters = JSON.parse(characters)
      page_characters.each do |character|
        new_char = Character.find_or_create_by(name: character["name"], url: character["url"])
      end
    end
  end
end
end
