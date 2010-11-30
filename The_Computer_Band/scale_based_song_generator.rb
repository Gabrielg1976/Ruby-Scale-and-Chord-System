require 'rubygems'
require 'midilib'
require 'timedtrack'

# Scales Library 

chromatic=[0,1,2,3,4,5,6,7,8,9,10,11,12] # C Db D Eb E F Gb G Ab A  Bb B  C
spanish_8_tone=[0,1,3,4,5,6,8,10,12]# C Db Eb E F Gb Ab Bb C
flamenco=[0,1,3,4,5,7,8,10,12]# C Db Eb E F G Ab Bb C
symmetrical=[0,1,3,4,6,7,9,10,12]# C Db Eb E Gb G A Bb C
diminished=[0,2,3,5,6,8,9,11,12]# C D Eb F Gb Ab A B C
whole_tone=[0,2,3,6,8,10,12]# C D E Gb Ab Bb C
augmented=[0,3,4,7,8,12]# C Eb E G Ab  C
three_semitone=[0,3,6,9,12]# C Eb Gb A C
four_semitone=[0,4,8,12]# C E Ab C
ultra_locrian=[0,1,3,6,8,9,12]# C Db Eb E Gb Ab A C
super_locrian=[0,1,3,4,6,8,10,12]# C Db Eb E Gb Ab Bb C
indian_ish=[0,1,3,4,7,8,10,12]# C Db Eb E G Ab Bb C
locrian=[0,1,3,5,6,8,10,12]# C Db Eb F Gb Ab Bb C
phrygian=[0,1,3,5,7,8,10,12]# C Db Eb F G  Ab Bb C
neapolitan_min=[0,1,3,5,7,8,11,12]#  C Db Eb F G Ab B C
javanese=[0,1,3,5,7,9,10,12]# C Db Eb F G A Bb C
neapolitan_maj=[0,1,3,7,9,9,11,12]#  C Db Eb F G A B C
todi=[0,1,3,6,7,8,11,12]# C Db Eb Gb G Ab B C
persian=[0,1,4,5,8,10,11,12]# C Db E F Gb Ab B C
oriental=[0,1,4,5,6,9,10,12]# C Db E F Gb A Bb C
maj_phryg=[0,1,4,5,6,8,10,12]# C Db E F G Ab Bb C
double_harmonic=[0,1,4,5,8,11,12]# C Db E F G Ab B C
marva=[0,1,4,6,7,9,11,12]# C Db E Gb G A B C
enigmatic=[0,1,4,6,8,10,11,12]# C Db E Gb Ab Bb B C
locrian_natural=[0,2,3,5,6,8,10,12]# C D Eb F Gb Ab Bb C
minor=[0,2,3,5,7,8,10,12]# (natural)C D Eb F G Ab Bb C
harmonic_minor=[0,2,3,5,7,8,11,12]# C D Eb F G Ab B C
dorian=[0,2,3,5,7,9,10,12]# C D Eb F G A Bb C
melodic_minor=[0,2,3,5,7,9,11,12]# C D Eb F G A B C
hungarian_gypsy =[0,2,3,6,7,8,10,12]# C D Eb Gb G Ab Bb C
hungarian_minor=[0,2,3,6,7,8,11,12]# C D Eb Gb G Ab B C
romanian=[0,2,3,6,7,9,10,12]# C D Eb Gb G A Bb C
maj_locrian=[0,2,4,5,6,8,10,12]# C  D  E  F  Gb Ab Bb C
hindu=[0,2,4,5,7,8,10,12]# C  D  E  F  G  Ab Bb C
ethiopian=[0,2,4,5,7,8,10,11,12]# C  D  E  F  G  Ab B  C
mixolydian=[0,2,4,5,7,9,10,12]# C  D  E  F  G  A  Bb C
major=[0,2,4,5,7,9,11,12]# C  D  E  F  G  A  B  C
mixolydian_aug=[0,2,4,5,8,10,12]# C  D  E  F  Ab A  Bb C
harmonic_major=[0,2,4,5,8,9,11,12]# C  D  E  F  Ab A  B  C  
lydian_min=[0,2,4,6,7,8,10,12]# C  D  E  Gb G  Ab Bb C  
lydian_dominant=[0,2,4,6,9,10,12]#C  D  E  Gb G  A  Bb C
lydian=[0,2,4,6,7,9,11,12]# C  D  E  Gb G  A  B  C 
lydian_aug=[0,2,4,6,8,9,10,12]# C  D  E  Gb Ab A  Bb C  
leading_whole_tone=[0,2,4,6,8,10,11,12]#   C  D  E  Gb Ab Bb B  C 
bluesy=[0,3,4,5,7,9,10,12]# C  Eb E  F  G  A  Bb C  
hungarian_major=[0,3,4,6,7,9,10,12]# C  Eb E  Gb G  A  Bb C 
pelog=[0,1,3,7,10,12]# C  Db Eb G  Bb C  
iwato=[0,1,5,6,10,12]# C  Db F  Gb Bb C 
japanese=[0,1,5,7,8,12]# C  Db F  G  Ab C 
hirajoshi=[0,2,3,7,8,12]# C  D  Eb G  Ab C
pentatonic_major=[0,2,4,7,9,12]# C  D  E  G  A  C  
egyptian=[0,2,5,7,10,12]# C  D  F  G  Bb C  
pentatonic_minor=[0,3,5,7,10,12]# C  Eb F  G  Bb C  
chinese=[0,4,6,7,11,12]# C  E  Gb G  B  C 

# This Build the Song

note_length=["8th","quarter","half","whole","16th","32nd"]


song = MIDI::Sequence.new

song.tracks << (melody = TimedTrack.new(0, song ))
song.tracks << (background = TimedTrack.new(1, song ))
song.tracks << (drumz = TimedTrack.new(2, song ))
song.tracks << (chord = TimedTrack.new(3, song ))



melody.instrument = 34 # 
background.instrument = 19 # Church organ
drumz.instrument = 99
chord.instrument = 01

# names the Tracks 
melody.name = "section 1"  
background.name = "section 2"
drumz.name = "Drumz"
chord.name = "chords"

melody.events << MIDI::Tempo.new(MIDI::Tempo.bpm_to_mpq(80))

# melody.events << MIDI::MetaEvent.new(MIDI::META_SEQ_NAME,'keys')
# background.events << MIDI::MetaEvent.new(MIDI::META_SEQ_NAME,'bass')
# drumz.events << MIDI::MetaEvent.new(MIDI::META_SEQ_NAME,'drumz')                                                                        'bass')
                                    
                                    
intervals=[]
# Some musically pleasing intervals: thirds and fifths.
intervals = lydian

# Start at middle C.
note=0
note1=0

# Create 8 measures of music in 4/4 time
(8*4).times do |i|
  
    note += intervals[rand(intervals.size)] 
    note1 += intervals[rand(intervals.size)]
  
  #Reset to middle C if we go out of the MIDI range 
   note = 0 if note < -39 or note > 48
   note1 = 0 if note < -39 or note > 48
   
  # Creates each of the Channels 
  
  melody.add_notes(note, rand(127),note_length[rand(note_length.size)])
  drumz.add_notes(note, rand(127),note_length[rand(note_length.size)])
  background.add_notes(note, rand(127),note_length[rand(note_length.size)])
  chord.minor_ii(note, rand(127),note_length[rand(note_length.size)]) if i % 4 == 0

end

puts "Whats the Title of this Composition ?"
title=gets.chomp!


open("#{title}"+'.mid', 'w') { |f| song.write(f) }
