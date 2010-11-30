# this is the testing bed for diffrent Ideas 

puts "what is the BPM ?"
bpm=gets.to_i

puts "#{bpm/4} measure of music is required for 1 minute"




# the Creation of a menu system

# option=0
# 
# until option == 7 
# 
# 
# puts " please choose a option\n"
# 
# puts "Title the Composition ( Press 1 )\n"
# puts "Set the Tempo ( Press 2 )\n"
# puts "View and Set Chord Progression ( Press 3 )"
# puts "Add a New Midi Channel ( Press 4 )"
# puts "Generate the Composition Press( 6 )\n"
# puts "exit program ( Press 7 )\n"
# 
# option=gets.to_i
# 
#   
# if option == 1
#   puts "you choose option 1"
# elsif option == 2
#   puts "you choose option 2"
# elsif option == 3
#   puts "you choose option 3"
#   
#   # Adds a New midi channel to the composition
#   elsif option == 4
#     
#     begin
#       # names the midi channel 
#       puts "Name the channel"
#       ch_name=gets.chomp!
#       
#       # lets you choose the instrument and shows all the options
#       puts "choose a instrument"
#       puts" 00 piano\n 01 electronic\n 03 strings 04 drums"
#       inst_num=gets.to_i
#       
#       puts "would you like this track to be chords ?"
#       
#       chord=gets.chomp!
#       x=""
#       # lets user choose if melody or a chords will be generated 
#       if chord == "y"
#        x = "a chord of choose will be played"
#       else
#        x = "a default melody will be generated here"
#       end
#       
#       puts "chords #{x}"
#       puts "instrument: #{inst_num}"
#       puts "Channels Name: #{ch_name}"
#       
#       
#     end
#     elsif option == 5
#       
#       puts "you choose option 3"
#       elsif option == 6
#         puts "you choose option 3"
#  end
# end




# arpeggator System logic 
maj_arp=[]

c=[0,12,24]
d=[2,14,26]

maj_arp << c << d 


4.times do 
 note = maj_arp[rand(maj_arp.size)]
 puts note
end

4.times do 
end



 

