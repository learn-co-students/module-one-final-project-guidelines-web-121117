module GenreMethods
  def check_case(input)
    input.split.map { |word| word.downcase == "tv" ? word.upcase : word.capitalize }.join(" ")
  end

  

end
