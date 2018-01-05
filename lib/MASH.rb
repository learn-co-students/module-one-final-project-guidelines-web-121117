# mash = [["1","2","3","4"],["5","6","7","8"],["9","10","11","12"],["13","14","15","16"]]
#
# "Welcome to Mash. Pick a number to continue."
# count = gets.chomp.to_i
# if count > 16
#   count/16 == 1 ? curr_section = (count/16.to_f).ceil
#   count%16 == 0 ? curr_idx = 4 : curr_idx = ((count%16)%4)
#   if mash[current_section].size != 1
#     mash[current_section].delete_at(current_idx)
#   else
#     #turn this into function, call recursively
#     mash.find{|section| section.size != 1}[current_section + 1].delete_at(0)
#   end
# elses
#   curr_section
#   curr_idx
# end
#
# end
