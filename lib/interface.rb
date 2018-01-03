require "colorize"

module Interface

  include MainMenu
  include RegionMenu
  include CharacterMenu
  include BookMenu
  include HouseMenu
  include InterfaceMethods

  def run
    greet
    main_menu_run
  end

end
