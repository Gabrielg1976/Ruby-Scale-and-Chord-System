require 'rubygems'
require 'midilib'
require 'rubymusicengine'
# arrays to store each octaves notes 

oct_1=[ ];oct_2=[ ];oct_3=[ ];oct_4=[ ]
oct_5=[ ];oct_6=[ ];oct_7=[ ];oct_8=[ ]

#each range is stored into corsponding octave

(0..12).each { |n| oct_1 << n }
(13..24).each { |n| oct_2 << n }
(25..36).each { |n| oct_3 << n }
(37..48).each { |n| oct_4 << n }
(49..60).each { |n| oct_5 << n }
(61..72).each { |n| oct_6 << n }
(73..84).each { |n| oct_7 << n }
(85..96).each { |n| oct_8 << n }

all_notes=[ oct_1,oct_2,oct_3,oct_4,oct_5,oct_6,oct_7,oct_8 ] 

# puts "This is Octave 1"
# p oct_1
# puts "This is Octave 2"
# p oct_2
# puts "This is Octave 3"
# p oct_3
# puts "This is Octave 4"
# p oct_4
# puts "This is Octave 5"
# p oct_5
# puts "This is Octave 6"
# p oct_6
# puts "This is Octave 7"
# p oct_7
# puts "This is Octave 8"
# p oct_8

track = [ ]

# puts all_notes[rand(all_notes.size)]
# 
64.times do 
  track << all_notes[rand(oct_1.size)]
end
# 
p track





