require "colorize"

module Interface

  include MainMenu
  include RegionMenu
  include RegionSpecificMenu
  include CharacterMenu
  include CharacterSpecificMenu
  include BookMenu
  include BookSpecificMenu
  include BookFactMenu
  include HouseMenu
  include HouseSpecificMenu
  include InterfaceMethods

  def run
    greet
    main_menu_run
  end

end
