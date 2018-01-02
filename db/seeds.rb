

module ApiParse

def self.get_all_characters
  page = 1
  characters = RestClient.get("https://anapioficeandfire.com/api/characters?page=#{page}&pageSize=50")g
  while !JSON.parse(characters).empty?
    page_characters = JSON.parse(characters)
    page_characters.each do |character|
      Character.find_or_create_by(name: character["name"], url: character["url"])
    end
    page += 1
  end
end
end
