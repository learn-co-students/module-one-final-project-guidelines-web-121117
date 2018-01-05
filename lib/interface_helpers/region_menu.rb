module RegionMenu

  def regions_menu_options
    puts "\nREGION MENU".colorize(:cyan).underline
    puts "Choose from one of the following categories to proceed:"
    puts "     Regions".colorize(:cyan) + " - see all regions in the GoT universe."
    puts "     Specific".colorize(:cyan) + " - search a specific region of the GoT Universe."
    puts "     Main Menu".colorize(:cyan) + " - back to the main menu."
    puts "\nPlease make a selection:"
    input = gets.downcase.chomp
  end

  def regions_menu
    input = regions_menu_options
    if input == "regions"
      puts "\n"
      puts all_regions
      puts "\n"
      regions_menu
    elsif input == "specific"
      puts "\n\n'I LIE AWAKE ALL NIGHT THINKING OF HOW THEY DIED.' - Sansa Stark".colorize(:cyan)
      region_specific_run
    elsif input == "main menu"
      main_menu_run
    elsif input == "exit"
      system("clear")
      good_bye
    else
      puts "\nIn Dorne, blood may be fire, but we're not there kids.".colorize(:cyan)
      regions_menu
    end
  end

end
