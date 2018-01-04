require "colorize"

module Interface

  include MainMenu
  include RegionMenu
  include CharacterMenu
  include CharacterSpecificMenu
  include BookMenu
  include BookPagesMenu
  include BookReleasesMenu
  include HouseMenu
  include InterfaceMethods

  def run
    greet
    ApiParse.data_check
    main_menu_run
  end

end
