module ActorMethods
  def check_case(input)
    input.split.map { |word| word.capitalize }.join(" ")
  end

  def movie_title_input
    puts "Type in an actor's full name to get started"
    input = check_case(gets.chomp)
    result = Actor.find_by(name: input)
    if result
      result
    else
      until Actor.find_by(name: input)
        puts "Could not find actor, Please enter a valid name:"
        input = check_case(gets.chomp)
        Actor.find_by(name: input)
      end
    end
  end

end
