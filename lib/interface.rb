require "colorize"

module Interface

  include MainMenu
  include RegionMenu
  include CharacterMenu
  include BookMenu
  include HouseMenu
  include InterfaceMethods

  def run
  end

  def greet
    puts "\nWelcome to the Game Of Thrones Ultimate Fan App!"
  end

  def good_bye
    puts "\nUntil next time...".colorize(:color => :red)
    puts "\n"
  end

end
