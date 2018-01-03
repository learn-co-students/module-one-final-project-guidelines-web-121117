require "colorize"

class Interface

  def greet
    puts "\nWelcome to the Game Of Thrones Ultimate Fan App!"
  end

  def all_characters
    Character.all.collect do |character|
      if character.name != nil
        character.name
      end
    end
  end

  def all_houses
    House.all.collect {|house| house.name}
  end

  def all_books
    Book.all.collect {|book| book.name}
  end

  def all_regions
    Region.all.collect {|region| region.name}
  end

  def main_menu_options
    puts "\nChoose from one of the follow categories to proceed:"
    puts "     Characters".colorize(:color => :red) + " - explore the characters of the GoT Universe."
    puts "     Houses".colorize(:color => :red) + " - explore the houses of the GoT Universe."
    puts "     Books".colorize(:color => :red) + " - learn about the GoT Books."
    puts "     Geography".colorize(:color => :red) + " - explore the regions of the GoT Universe."
    puts "     Exit".colorize(:color => :red) + " - goodbye until next time."
    puts "\nPlease make a selection:"
    input = gets.downcase.chomp
  end

  def characters_menu_options
    puts "\n\nChoose from one of the following categories to proceed:"
    puts "     List All Characters".colorize(:color => :blue) + " - explore the characters of the GoT Universe."
    puts "     List Character's Allegiances".colorize(:color => :blue) + " - see where a specific character's allegiances lie."
    puts "     List Character's Book Appearances".colorize(:color => :blue) + " - see which books a specific character appears in."
    puts "     List Character's TV Show Appearances".colorize(:color => :blue) + " - see which season a specific character appears in."
    puts "     Main Menu".colorize(:color => :blue) + " - back to the main menu."
    puts "\nPlease make a selection:"
    input = gets.downcase.chomp
  end

  def houses_menu_options
    puts "\n\nChoose from one of the following categories to proceed:"
    puts "     List All Houses".colorize(:color => :green) + " - explore the houses of the GoT Universe."
    puts "     List House's Characters".colorize(:color => :green) + " - see who belongs to what house."
    puts "     List Character Allegiances".colorize(:color => :green) + " - see which characters hold allegiances to a specific house."
    puts "     List House's Location".colorize(:color => :green) + " - see what region a house is located."
    puts "     Main Menu".colorize(:color => :green) + " - back to the main menu."
    puts "\nPlease make a selection:"
    input = gets.downcase.chomp
  end

  def books_menu_options
    puts "\n\nChoose from one of the following categories to proceed:"
    puts "     List All Books".colorize(:color => :magenta) + " - see all GoT books."
    puts "     List Characters In Book".colorize(:color => :magenta) + " - see which characters appear in a specific book."
    puts "     Main Menu".colorize(:color => :magenta) + " - back to the main menu."
    puts "\nPlease make a selection:"
    input = gets.downcase.chomp
  end

  def geography_menu_options
    puts "\n\nChoose from one of the following categories to proceed:"
    puts "     List All Regions".colorize(:color => :cyan) + " - see all GoT regions."
    puts "     List All Houses".colorize(:color => :cyan) + " - see which houses are from a specific region."
    puts "     List All Characters".colorize(:color => :cyan) + " - see which characters are from a specific region."
    puts "     Main Menu".colorize(:color => :cyan) + " - back to the main menu."
    puts "\nPlease make a selection:"
    input = gets.downcase.chomp
  end

  def characters_menu
    input = characters_menu_options
    if input == "list all characters"
      puts all_characters
      puts "\n"
      characters_menu
    elsif input == "list character's allegiances"
    elsif input == "list character's book appearances"
    elsif input == "list character's tv show appearances"
    elsif input == "main menu"
      main_menu_run
    elsif input == "exit"
      good_bye
    else
      puts "\nWhile a Lannister always pays his debts, please stick to the script.".colorize(:color => :blue)
      characters_menu
    end
  end

  def houses_menu
    input = houses_menu_options
    if input == "list all houses"
      puts all_houses
      puts "\n"
      houses_menu
    elsif input == "list house's characters"
    elsif input == "list character allegiances"
    elsif input == "list house's location"
    elsif input == "main menu"
      main_menu_run
    elsif input == "exit"
      good_bye
    else
      puts "\nPlease don't wonder beyond the wall.".colorize(:color => :green)
      houses_menu
    end
  end

  def books_menu
    input = books_menu_options
    if input == "list all books"
      puts all_books
      puts "\n"
      books_menu
    elsif input == "list characters in book"
    elsif input == "main menu"
      main_menu_run
    elsif input == "exit"
      good_bye
    else
      puts "\nI'm not writing 'A Chronicle of the Wars Following the Death of
       King Robert I,' so it can sit on the shelf unread.".colorize(:color => :magenta)
      books_menu
    end
  end

  def geography_menu
    input = geography_menu_options
    if input == "list all regions"
      puts all_regions
      puts "\n"
      geography_menu
    elsif input == "list all houses"
    elsif input == "list all characters"
    elsif input == "main menu"
      main_menu_run
    elsif input == "exit"
      good_bye
    else
      puts "\nIn Dorne, blood may be fire, but we're not there kids.".colorize(:color => :cyan)
      geography_menu
    end
  end

  def good_bye
    puts "\nUntil next time...".colorize(:color => :red)
    puts "\n"
  end

  def main_menu_run
    input = main_menu_options

    if input == "characters"
      puts "\n\n'THE GOOD LORDS ARE DEAD, AND THE REST ARE MONSTERS.' - Brienne of Tarth".colorize(:color => :blue)
      characters_menu
    elsif input == "houses"
      puts "\n\n'I AM A WOLF AND WILL NOT BE AFRAID' - Arya Stark".colorize(:color => :green)
      houses_menu
    elsif input == "books"
      puts "\n\n'POSSIBLY SOMETHING A BIT MORE POETIC?' - Sam Tarly".colorize(:color => :magenta)
      books_menu
    elsif input == "geography"
      puts "\n\n'THEY CAN LIVE IN MY NEW WORLD, OR THEY CAN DIE IN THEIR OLD ONE' - Daenerys Targaryen".colorize(:color => :cyan)
      geography_menu
    elsif input == "exit"
      good_bye
    else
      puts "\nWhile Cersei would have you killed for that choice, we'll give you another chance.".colorize(:color => :red)
      main_menu_run
    end
  end
end
