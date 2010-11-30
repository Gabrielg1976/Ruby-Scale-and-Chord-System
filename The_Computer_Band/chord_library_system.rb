require 'rubygems'
require 'midilib'
require 'rubymusicengine'


# The Concept here is to create and force patterns  
# Blending Abstraction with chord progressions
# Build Muiltable Pattern Generators for Songs section 
# create A single Method that will create a complete musical score Reach for Audio AI  

# Each Notes 8 octave range in midi format.
c=[0,12,24,36,48,60,72,84,96,108,120]
cs=[1,13,25,37,49,61,73,85,97,109,121]
d=[2,14,26,38,50,62,74,86,98,110,122]
ds=[3,15,27,39,51,63,75,87,99,111,123]
e=[4,16,28,40,52,64,76,88,100,112,124]
f=[5,17,29,41,53,65,77,89,101,113,125]
fs=[6,18,30,42,54,66,78,90,102,114,126]
g=[7,19,31,43,55,67,79,91,103,115,127]
gs=[8,20,32,44,56,68,80,92,104,116]
a=[9,21,33,45,57,69,81,93,105,117]
as=[10,22,34,46,58,70,82,94,106,118]
b=[11,23,35,47,59,71,83,95,107,119]

# This is a 8 octave range of possiable notes with a given chord  

# C major
major_i = [0,12,24,36,48,60,72,84,96,108,120,4,16,28,40,52,64,76,88,100,112,124,7,19,31,43,55,67,79,91,103,115,127]
# d minor
minor_ii = [2,14,26,38,50,62,74,86,98,110,122,5,17,29,41,53,65,77,89,101,113,125,9,21,33,45,57,69,81,93,105,117]
# e minor
minor_iii = [4,16,28,40,52,64,76,88,100,112,124,7,19,31,43,55,67,79,91,103,115,127,11,23,35,47,59,71,83,95,107,119]
# f major
major_iv = [5,17,29,41,53,65,77,89,101,113,125,9,21,33,45,57,69,81,93,105,117,0,12,24,36,48,60,72,84,96,108,120]
# g major
major_v = [7,19,31,43,55,67,79,91,103,115,127,11,23,35,47,59,71,83,95,107,119,2,14,26,38,50,62,74,86,98,110,122]
# a minor
minor_vi = [9,21,33,45,57,69,81,93,105,117,0,12,24,36,48,60,72,84,96,108,120,4,16,28,40,52,64,76,88,100,112,124]
# b minor 
minor_vii = [11,23,35,47,59,71,83,95,107,119,2,14,26,38,50,62,74,86,98,110,122,5,17,29,41,53,65,77,89,101,113,125]


# build advance chord system for 7th 9th 11th ect.. 

major_9th=[]
major_7th=[]
major_jazz_7th=[]
major_blues_7th=[]
major_11th=[]
major_13th=[]
augmented=[]
dimished=[]

# major i
maj_i_arp << c << e << g 
# minor ii
min_ii_arp << d << f << a
# minor iii
min_iii_arp << e << g << b
# major iv
maj_iv_arp << f << a << c
# major v
maj_v_arp << g << b << d
# minor vi
min_vi_arp << a << c << e
# minor vii
min_vii_arp << b << d << f 

# generates arpeggsions based off the chords  

note = maj_i_arp[rand(maj_i_arp.size)]

note = min_ii_arp[rand(min_ii_arp.size)]

note = min_iii_arp[rand(min_iii_arp.size)]

note = maj_iv_arp[rand(maj_iv_arp.size)]

note = maj_v_arp[rand(maj_v_arp.size)]

note = min_vi_arp[rand(min_vi_arp.size)]

note = min_vii_arp[rand(min_vii_arp.size)]

=begin 

Basic Idea for building chord structure
contains 17 standard chords 

Building chordpression system based off this logic 

=end

# major chord
def add_major(low_note, velocity=127, duration='quarter')
 add_notes([0, 4, 7].collect { |x| x + low_note }, velocity, duration)
end

# minor chord
def add_minor(low_note, velocity=127, duration='quarter')
 add_notes([0, 3, 7].collect { |x| x + low_note }, velocity, duration)
end

# chord dimished
def add_dmin(low_note, velocity=127, duration='quarter')
 add_notes([0, 3, 6].collect { |x| x + low_note }, velocity, duration)
end

# chord augmented
def add_aug(low_note, velocity=127, duration='quarter')
 add_notes([0, 4, 8].collect { |x| x + low_note }, velocity, duration)
end

# chord sus
def add_sus(low_note, velocity=127, duration='quarter')
 add_notes([0, 5, 7].collect { |x| x + low_note }, velocity, duration)
end

# chord major 6th
def add_6th(low_note, velocity=127, duration='quarter')
 add_notes([0, 4, 7, 9].collect { |x| x + low_note }, velocity, duration)
end

# chord minor 6th
def add_minor_6th(low_note, velocity=127, duration='quarter')
 add_notes([0, 3, 7, 9].collect { |x| x + low_note }, velocity, duration)
end

# chord 7th
def add_7th(low_note, velocity=127, duration='quarter')
 add_notes([0, 4, 7, 10].collect { |x| x + low_note }, velocity, duration)
end

# chord major 7th
def add_major_7th(low_note, velocity=127, duration='quarter')
 add_notes([0, 4, 7, 11].collect { |x| x + low_note }, velocity, duration)
end

# chord minor 7th
def add_minor_7th(low_note, velocity=127, duration='quarter')
 add_notes([0, 3, 7, 10].collect { |x| x + low_note }, velocity, duration)
end

# chord dimished 7th
def add_dim_7th(low_note, velocity=127, duration='quarter')
 add_notes([0, 3, 6, 9].collect { |x| x + low_note }, velocity, duration)
end

# chord add 9
def add_added9(low_note, velocity=127, duration='quarter')
  add_notes([0, 4, 7, 14].collect { |x| x + low_note }, velocity, duration)
end

# chord  9th
def add_9th(low_note, velocity=127, duration='quarter')
 add_notes([0, 4, 7, 10, 14].collect { |x| x + low_note }, velocity, duration)
end

# chord major 9th
def add_major_9th(low_note, velocity=127, duration='quarter')
 add_notes([0, 4, 7, 11, 14].collect { |x| x + low_note }, velocity, duration)
end

# chord minor 9th
def add_minor_9th(low_note, velocity=127, duration='quarter')
 add_notes([0, 3, 7].collect { |x| x + low_note }, velocity, duration)
end

# chord major 11th
def add_major_11th(low_note, velocity=127, duration='quarter')
 add_notes([0, 4, 7, 10, 14, 17].collect { |x| x + low_note }, velocity, duration)
end

# chord major 13th
def add_major_13th(low_note, velocity=127, duration='quarter')
 add_notes([0, 4, 7, 10, 14, 21].collect { |x| x + low_note }, velocity, duration)
end





def note_creator
 major_i = [0,12,24,36,48,60,72,84,96,108,120]
 pattern=[]
 
 major_i.each do |n|
  pattern << n + 10
  
 end
 
 puts pattern.join(",")
end

#note_creator

def major_arp
  # lets the user choose the number of notes they would like to have. 
  puts "how notes would yoi like in this section of the composition?"
  x=gets.to_i
  
  major_i = [0,12,24,36,48,60,72,84,96,108,120,4,16,28,40,52,64,76,88,100,112,124,7,19,31,43,55,67,79,91,103,115,127]
  
  x.times do
   puts major_i[rand(major_i.size)]
  end
end

# major_arp

def i_iv_v
  # C major
  major_i = [0,12,24,36,48,60,72,84,96,108,120,4,16,28,40,52,64,76,88,100,112,124,7,19,31,43,55,67,79,91,103,115,127]
  # f major
  major_iv = [5,17,29,41,53,65,77,89,101,113,125,9,21,33,45,57,69,81,93,105,117,0,12,24,36,48,60,72,84,96,108,120]
  # g major
  major_v = [7,19,31,43,55,67,79,91,103,115,127,11,23,35,47,59,71,83,95,107,119,2,14,26,38,50,62,74,86,98,110,122]
 
 # stores the composition generated.
  pattern=[]

 3.times do
 
puts "C major"
  4.times do
    pattern << major_i[rand(major_i.size)]
  end
puts "F major"
  4.times do
    pattern << major_iv[rand(major_iv.size)]
  end
puts "G major"
  4.times do
    pattern << major_v[rand(major_v.size)]
  end
end
pattern.to_midi("2channel_demo2.mid")

 end


#i_iv_v