class MovieMethods

  def check_case(input)
    non_capitals = ["and", "the", "of", "in", "v"]
    input.split.map.with_index do |word, idx|
      idx != 0 && non_capitals.include?(word) ? word.downcase : word.capitalize
    end.join(" ")
  end

  def movie_title_input
    puts "Type in a movie to get started"
    input = check_case(gets.chomp)
    result = Movie.find_by(name: input)
    if result
      result
    else
      until Movie.find_by(name: input)
        input = check_case(gets.chomp)
        Movie.find_by(name: input)
      end
    end
  end



end
