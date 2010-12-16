=begin 

The Algorithmic Machine Quartet 

Concept and Design by Gabriel Garrod ( GDG Software Designs LLC )

Designed to Concept of 4 part Harmony based around stanard phrase patterns

54 scale library to choose from  
21 Standard Chords + Power Chords and intervals   
12 Different standard Phrase Patterns

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::
 
Lastest update:  12/12/2010 
Number of Lines: 823 lines
File Size: 24,946(k)

=end
require 'rubygems'
require 'midilib'

# Scale Library 54 Total 
begin 
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
end

scale_num = rand(54)
 
 # builds the logic for choosing the correct scale when ask by the user ( I know Really Messy but works )# # #
 if scale_num == 1
   interval = chromatic  
  elsif scale_num == 2
   interval = spanish_8_tone
  elsif scale_num == 3 
   interval = flamenco
  elsif scale_num == 4 
   interval = symmetrical
  elsif scale_num == 5 
   interval = diminished
  elsif scale_num == 6 
   interval = whole_tone
  elsif scale_num == 7
   interval = augmented
  elsif scale_num == 8
   interval = three_semitone
  elsif scale_num == 9
   interval = four_semitone
  elsif scale_num == 10
   interval = ultra_locrian
  elsif scale_num == 11
   interval = super_locrian
  elsif scale_num == 12
   interval = indian_ish
  elsif scale_num == 13
   interval = locrian
  elsif scale_num == 14
   interval = phrygian
  elsif scale_num == 15
   interval = neapolitan_min
  elsif scale_num == 16
   interval = javanese
  elsif scale_num == 17
   interval = neapolitan_maj
  elsif scale_num == 18
   interval = todi 
  elsif scale_num == 19
   interval = persian
  elsif scale_num == 20
   interval = oriental
  elsif scale_num == 21
   interval = maj_phryg
  elsif scale_num == 22
   interval = double_harmonic 
  elsif scale_num == 23
   interval = marva
  elsif scale_num == 24 
   interval = enigmatic
  elsif scale_num == 25 
   interval = locrian_natural
  elsif scale_num == 26
   interval = minor 
  elsif scale_num == 27
   interval = harmonic_minor
  elsif scale_num == 28 
   interval = dorian 
  elsif scale_num == 29
   interval = melodic_minor
  elsif scale_num == 30
   interval = hungarian_gypsy
  elsif scale_num == 31
   interval = hungarian_minor
  elsif scale_num == 32 
   interval = romanian 
  elsif scale_num == 33
   interval = maj_locrian
  elsif scale_num == 34
   interval = hindu 
  elsif scale_num == 35
   interval = ethiopian
  elsif scale_num == 36 
   interval = mixolydian
  elsif scale_num == 37 
   interval = major
  elsif scale_num == 38
   interval = mixolydian_aug
  elsif scale_num == 39
   interval = harmonic_major  
  elsif scale_num == 40
   interval = lydian_min
  elsif scale_num == 41  
   interval = lydian_dominant
  elsif scale_num == 42
   interval = lydian 
  elsif scale_num == 43
   interval = lydian_aug
  elsif scale_num == 44 
   interval = leading_whole_tone
  elsif scale_num == 45 
   interval = bluesy   
  elsif scale_num == 46
   interval = hungarian_major
  elsif scale_num == 47  
   interval = pelog   
  elsif scale_num == 48
   interval = iwato  
  elsif scale_num == 49
   interval = japanese
  elsif scale_num == 50
   interval = hirajoshi
  elsif scale_num == 51
   interval = pentatonic_major
  elsif scale_num == 52  
   interval = egyptian 
  elsif scale_num == 53 
   interval = pentatonic_minor
  elsif scale_num == 54  
   interval = chinese
  else
   interval = major
 end
 # end if the scale choosing logic # # # # # #

# used to set the scale choosen by the User
scale_num=0

# this is the TimedTrack Class and All its Logic 

class TimedTrack < MIDI::Track
  
	  MIDDLE_C = 60
	  @@channel_counter=0

	  def initialize(number, song)
	    super(number)
	    @sequence = song
	    @time = 0
	    @channel = @@channel_counter
	    @@channel_counter += 1
	  end

	  # Tell this track's channel to use the given instrument, and
	  # also set the track's instrument display name.
	  def instrument=(instrument)
	    @events <<  
MIDI::ProgramChange.new(@channel, instrument)
	    super(MIDI::GM_PATCH_NAMES[instrument])
	  end

	  # Add one or more notes to sound simultaneously. Increments the per-track
	  # timer so that subsequent notes will sound after this one finishes.
	  def add_notes(offsets, velocity=127, duration='quarter')
	    offsets = [offsets] unless offsets.respond_to? :each
	    offsets.each do |offset|
	      event(MIDI::NoteOnEvent.new(@channel, MIDDLE_C + offset, velocity))
	    end
	    @time += @sequence.note_to_delta(duration)
	    offsets.each do |offset|
	      event(MIDI::NoteOffEvent.new(@channel, MIDDLE_C + offset, velocity))
	    end
	    recalc_delta_from_times
	  end
  
	  private

	  def event(event)
	    @events << event
	   event.time_from_start = @time
	  end
end

# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# The Menu System and Interface to the logic # # # # # # 

puts " The Algorithmic Machine Quartet \n"

# controls the automation of tempo selection
tempo_range=[]
(40...200).each { |x| tempo_range << x }
tempo_range[rand(tempo_range.size)]
tempo=tempo_range[rand(tempo_range.size)]

scale_num = rand(54) # controls the automation of the scale selection 

# This can be taken all the way to 128th 
note_length=["8th","quarter","half","whole"]

# => Arppeggition system core Logic <= ::::::::::::::

begin

  # Build a A chord Library with all major and minor chord patterns Total Chords => ( 37 ) 
  # Based on The Root
  add_major=[]
  add_minor=[]
  add_dmin=[]
  add_aug=[]
  add_sus=[]
  add_sus_7th=[]
  add_sus_6th_7th=[]
  add_sus_7th_11th=[]
  add_6th=[]
  add_major_7th=[]
  add_minor_6th=[]
  add_7th=[]
  add_minor_7th=[]
  add_dim_7th=[]
  add_added9=[]
  add_9th=[]
  add_major_9th=[]
  add_minor_9th=[]
  add_major_11th=[]
  add_major_13th=[]
  major_i=[]
  minor_ii=[]
  minor_iii=[]
  major_iv=[]
  major_v=[]
  minor_vi=[]
  minor_vii=[]
  # set of powerchord varations
  power_4th=[]
  power_5th=[]
  power_6th=[]
  power_7th=[]
  power_9th=[]
  power_11th=[]
  power_13th=[]
  # Extra chords 
  major_II=[]
  minor_ii_dim=[]
  major_III=[]
  major_v_7th=[]
  # dimished minor ii chord
  minor_ii_dim << interval[2] << interval[5] << interval[8]
  # V/7th chord 
  major_v_7th << interval[7] << interval[11] << interval[14] << interval[22]
  # Major II 
  major_II << interval[2] << interval[6] << interval[9]
  # Major III 
  major_III << interval[4] << interval[8] << interval[11]
  # major chord
  add_major << interval[0] << interval[4] << interval[7] 
  # minor chord
  add_minor << interval[0] << interval[3] << interval[7]
  # chord dimished
  add_dmin << interval[0] << interval[3] << interval[6]
  # chord augmented
  add_aug << interval[0] << interval[4] << interval[8]
  # chord sus
  add_sus << interval[0] << interval[5] << interval[7]
  # chord sus 7th
  add_sus_7th << interval[0] << interval[5] << interval[7] << interval[10]
  # chord sus 6/7th
  add_sus_6th_7th << interval[0]<< interval[5] << interval[7] << interval[9] << interval[10]
  # chord sus 7/11th 
  add_sus_7th_11th << interval[0]<< interval[4] << interval[7] << interval[10] << interval[17]
  # chord major 6th
  add_6th << interval[0] << interval[4] << interval[7] << interval[9]
  # chord minor 6th
  add_minor_6th << interval[0] <<interval[3] <<interval[7] <<interval[9] 
  # chord 7th
  add_7th << interval[0] << interval[4] << interval[7] << interval[10]
  # chord major 7th
  add_major_7th << interval[0] << interval[4] << interval[7] << interval[11]
  # chord minor 7th
  add_minor_7th << interval[0] << interval[3] << interval[7] << interval[10]
  # chord dimished 7th
  add_dim_7th << interval[0] << interval[3] << interval[6] << interval[9]
  # chord add 9
  add_added9  << interval[0] << interval[4] << interval[7] << interval[14]
  # chord  9th
  add_9th << interval[0] << interval[4] << interval[7] << interval[10] << interval[14]
  # chord major 9th
  add_major_9th << interval[0] << interval[4] << interval[7] << interval[11] << interval[14]
  # chord minor 9th
  add_minor_9th << interval[0] << interval[3] << interval[7] << interval[11] << interval[14] 
  # chord major 11th
  add_major_11th << interval[0] << interval[4] << interval[7] << interval[10] << interval[14] << interval[17]
  # chord major 13th
  add_major_13th << interval[0] << interval[4] << interval[7] << interval[10] << interval[14] << interval[21]
  # chord I
  major_i << interval[0] << interval[4] << interval[7]
  # chord ii
  minor_ii << interval[2] << interval[5] << interval[9] 
  # chord iii
  minor_iii << interval[4] << interval[7] << interval[11] 
  # chord IV
  major_iv << interval[5] << interval[9] << interval[12]
  # chord V
  major_v << interval[7] << interval[11] << interval[14]
  # chord vi
  minor_vi << interval[9] << interval[12] << interval[16]
  # chord vii
  minor_vii << interval[11] << interval[14] << interval[17]
  # Custom Power Chord Patterns 
  power_5th << interval[0] << interval[7]
  power_4th << interval[0] << interval[5]
  power_6th << interval[0] << interval[9]
  power_7th << interval[0]<< interval[11]
  power_9th << interval[0]<< interval[14]
  power_11th << interval[0]<< interval[17]
  power_13th << interval[0]<< interval[21]
end

 # => Arpeggiation system ends <= :::::::::::::::::
 
 #::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
 # Creates the Song object 
 #::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

 song = MIDI::Sequence.new

 # How the tracks are created you can add as many has you like manual here 

 song.tracks << (section_1 = TimedTrack.new(0, song ))
 song.tracks << (section_2 = TimedTrack.new(1, song ))
 song.tracks << (section_3 = TimedTrack.new(2, song ))
 song.tracks << (section_4 = TimedTrack.new(3, song ))

 # Chooses the channels Instrument
 section_1.instrument = 66
 section_2.instrument = 00
 section_3.instrument = 50
 section_4.instrument = 32

 # Names the tracks
 section_1.name = "Section 1"
 section_2.name = "Section 2"
 section_3.name = "Section 3"
 section_4.name = "Section 4"
 
 section_1.events << MIDI::Tempo.new(MIDI::Tempo.bpm_to_mpq(tempo))
 
 #::::::::::::::::::::::::::::::::::
 # Creates the Musical Composition
 #::::::::::::::::::::::::::::::::::
  
 # Default C Major Scale  
  note = interval[rand(interval.size)] + rand(11)

 # Reset to middle C if we go out of the MIDI range 
  note = 0 if note < -39  or note > 48
  
        #  number of times to play the I chord 
   4.times do
    section_1.add_notes(major_i[rand(major_i.size)],rand(77) + 50,note_length[rand(note_length.size)])
    section_2.add_notes(major_i[rand(major_i.size)],rand(77) + 50,note_length[rand(note_length.size)])
    section_3.add_notes(major_i[rand(major_i.size)],rand(77) + 50,note_length[rand(note_length.size)])
    section_4.add_notes(major_i[rand(major_i.size)],rand(77) + 50,note_length[rand(note_length.size)])
    section_1.add_notes(major_iv[rand(major_iv.size)],rand(77) + 50,note_length[rand(note_length.size)])
     section_2.add_notes(major_iv[rand(major_iv.size)],rand(77) + 50,note_length[rand(note_length.size)])
     section_3.add_notes(major_iv[rand(major_iv.size)],rand(77) + 50,note_length[rand(note_length.size)])
     section_4.add_notes(major_iv[rand(major_iv.size)],rand(77) + 50,note_length[rand(note_length.size)])
   end

 
 # Names and Generates the actual midi file.
 open("AMQ"+".mid",'w') { |f| song.write(f) }
 
 puts " Scale choosen = #{scale_num}"
 puts "The Tempo is #{tempo}"
 puts "Composition Generation Complete!"
 
=begin =>  Create a system of all the possiable Varitions to the first phrase. 

  
  var 1 = IV ii I V I * Done
  
  1.times do 
  
    1.times do
     section_1.add_notes(major_iv[rand(major_iv.size)],rand(77) + 50,note_length[rand(note_length.size)])
     section_2.add_notes(major_iv[rand(major_iv.size)],rand(77) + 50,note_length[rand(note_length.size)])
     section_3.add_notes(major_iv[rand(major_iv.size)],rand(77) + 50,note_length[rand(note_length.size)])
     section_4.add_notes(major_iv[rand(major_iv.size)],rand(77) + 50,note_length[rand(note_length.size)])
    end
  
    1.times do
     section_1.add_notes(minor_ii[rand(minor_ii.size)],rand(77) + 50,note_length[rand(note_length.size)])
     section_2.add_notes(minor_ii[rand(minor_ii.size)],rand(77) + 50,note_length[rand(note_length.size)])
     section_3.add_notes(minor_ii[rand(minor_ii.size)],rand(77) + 50,note_length[rand(note_length.size)])
     section_4.add_notes(minor_ii[rand(minor_ii.size)],rand(77) + 50,note_length[rand(note_length.size)])
    end
  
    1.times do
     section_1.add_notes(major_i[rand(major_i.size)],rand(77) + 50,note_length[rand(note_length.size)])
     section_2.add_notes(major_i[rand(major_i.size)],rand(77) + 50,note_length[rand(note_length.size)])
     section_3.add_notes(major_i[rand(major_i.size)],rand(77) + 50,note_length[rand(note_length.size)])
     section_4.add_notes(major_i[rand(major_i.size)],rand(77) + 50,note_length[rand(note_length.size)])
    end
  
    1.times do
     section_1.add_notes(major_v[rand(major_v.size)],rand(77) + 50,note_length[rand(note_length.size)])
     section_1.add_notes(major_v[rand(major_v.size)],rand(77) + 50,note_length[rand(note_length.size)])
     section_1.add_notes(major_v[rand(major_v.size)],rand(77) + 50,note_length[rand(note_length.size)])
     section_1.add_notes(major_v[rand(major_v.size)],rand(77) + 50,note_length[rand(note_length.size)])
    end
  
    1.times do
     section_1.add_notes(major_i[rand(major_i.size)],rand(77) + 50,note_length[rand(note_length.size)])
     section_1.add_notes(major_i[rand(major_i.size)],rand(77) + 50,note_length[rand(note_length.size)])
     section_1.add_notes(major_i[rand(major_i.size)],rand(77) + 50,note_length[rand(note_length.size)])
     section_1.add_notes(major_i[rand(major_i.size)],rand(77) + 50,note_length[rand(note_length.size)])
    end
  
  end
  
  var 2 = ii I V I * Done
  
  1.times do   
  
    1.times do
     section_1.add_notes(minor_ii[rand(minor_ii.size)],rand(77) + 50,note_length[rand(note_length.size)])
    end
  
    1.times do
     section_1.add_notes(major_i[rand(major_i.size)],rand(77) + 50,note_length[rand(note_length.size)])
    end
  
    1.times do
     section_1.add_notes(major_v[rand(major_v.size)],rand(77) + 50,note_length[rand(note_length.size)])
    end
  
    1.times do
     section_1.add_notes(major_i[rand(major_i.size)],rand(77) + 50,note_length[rand(note_length.size)])
    end
  
  end
  
  var 3 = IV ii IV ii I V I * Done 
  
  1.times do 
  
    1.times do
     section_1.add_notes(major_iv[rand(major_iv.size)],rand(77) + 50,note_length[rand(note_length.size)])
    end
  
    1.times do
     section_1.add_notes(minor_ii[rand(minor_ii.size)],rand(77) + 50,note_length[rand(note_length.size)])
    end
  
    1.times do
     section_1.add_notes(major_iv[rand(major_iv.size)],rand(77) + 50,note_length[rand(note_length.size)])
    end
  
    1.times do
     section_1.add_notes(minor_ii[rand(minor_ii.size)],rand(77) + 50,note_length[rand(note_length.size)])
    end
  
    1.times do
     section_1.add_notes(major_i[rand(major_i.size)],rand(77) + 50,note_length[rand(note_length.size)])
    end
  
    1.times do
     section_1.add_notes(major_v[rand(major_v.size)],rand(77) + 50,note_length[rand(note_length.size)])
    end
  
    1.times do
     section_1.add_notes(major_i[rand(major_i.size)],rand(77) + 50,note_length[rand(note_length.size)])
    end
  
  end
  
  var 4 = I V vi ii I V I * Done 
  
  1.times do 
  
    1.times do
     section_1.add_notes(major_i[rand(major_i.size)],rand(77) + 50,note_length[rand(note_length.size)])
    end
  
    1.times do
     section_1.add_notes(major_v[rand(major_v.size)],rand(77) + 50,note_length[rand(note_length.size)])
    end
  
    1.times do
     section_1.add_notes(minor_vi[rand(minor_vi.size)],rand(77) + 50,note_length[rand(note_length.size)])
    end
  
    1.times do
     section_1.add_notes(minor_ii[rand(minor_ii.size)],rand(77) + 50,note_length[rand(note_length.size)])
    end
  
    1.times do
     section_1.add_notes(major_i[rand(major_i.size)],rand(77) + 50,note_length[rand(note_length.size)])
    end
  
    1.times do
     section_1.add_notes(major_v[rand(major_v.size)],rand(77) + 50,note_length[rand(note_length.size)])
    end
  
    1.times do
     section_1.add_notes(major_i[rand(major_i.size)],rand(77) + 50,note_length[rand(note_length.size)])
    end
  
  end
  
  var 5 = I V vi IV I V I * Done
  
  1.times do 
  
    1.times do
     section_1.add_notes(major_i[rand(major_i.size)],rand(77) + 50,note_length[rand(note_length.size)])
    end
  
    1.times do
     section_1.add_notes(major_v[rand(major_v.size)],rand(77) + 50,note_length[rand(note_length.size)])
    end
  
    1.times do
     section_1.add_notes(major_iv[rand(major_iv.size)],rand(77) + 50,note_length[rand(note_length.size)])
    end
  
    1.times do
     section_1.add_notes(major_iv[rand(major_iv.size)],rand(77) + 50,note_length[rand(note_length.size)])
    end
  
    1.times do
     section_1.add_notes(major_i[rand(major_i.size)],rand(77) + 50,note_length[rand(note_length.size)])
    end
  
    1.times do
     section_1.add_notes(major_v[rand(major_v.size)],rand(77) + 50,note_length[rand(note_length.size)])
    end
  
    1.times do
     section_1.add_notes(major_i[rand(major_i.size)],rand(77) + 50,note_length[rand(note_length.size)])
    end
  
  
  end
  
  var 6 = I V I ii I V vi IV ii I V I * Done 
  
  1.times do 
  
    1.times do
     section_1.add_notes(major_i[rand(major_i.size)],rand(77) + 50,note_length[rand(note_length.size)])
    end
  
    1.times do
     section_1.add_notes(major_v[rand(major_v.size)],rand(77) + 50,note_length[rand(note_length.size)])
    end
  
    1.times do
     section_1.add_notes(major_i[rand(major_i.size)],rand(77) + 50,note_length[rand(note_length.size)])
    end
  
    1.times do
     section_1.add_notes(minor_ii[rand(minor_ii.size)],rand(77) + 50,note_length[rand(note_length.size)])
    end
  
    1.times do
     section_1.add_notes(major_i[rand(major_i.size)],rand(77) + 50,note_length[rand(note_length.size)])
    end
  
    1.times do
     section_1.add_notes(major_v[rand(major_v.size)],rand(77) + 50,note_length[rand(note_length.size)])
    end
  
    1.times do
     section_1.add_notes(minor_vi[rand(minor_vi.size)],rand(77) + 50,note_length[rand(note_length.size)])
    end
  
    1.times do
     section_1.add_notes(major_iv[rand(major_iv.size)],rand(77) + 50,note_length[rand(note_length.size)])
    end
  
    1.times do
     section_1.add_notes(minor_ii[rand(minor_ii.size)],rand(77) + 50,note_length[rand(note_length.size)])
    end
  
    1.times do
     section_1.add_notes(major_i[rand(major_i.size)],rand(77) + 50,note_length[rand(note_length.size)])
    end
  
    1.times do
     section_1.add_notes(major_v[rand(major_v.size)],rand(77) + 50,note_length[rand(note_length.size)])
    end
  
    1.times do
     section_1.add_notes(major_i[rand(major_i.size)],rand(77) + 50,note_length[rand(note_length.size)])
    end
  
  end
  
  var 7 = I V I ii I V vi ii I V I 
  
  1.times do 
  
    1.times do
     section_1.add_notes(major_i[rand(major_i.size)],rand(77) + 50,note_length[rand(note_length.size)])
    end
  
    1.times do
     section_1.add_notes(major_i[rand(major_i.size)],rand(77) + 50,note_length[rand(note_length.size)])
    end
  
    1.times do
     section_1.add_notes(major_i[rand(major_i.size)],rand(77) + 50,note_length[rand(note_length.size)])
    end
  
    1.times do
     section_1.add_notes(major_i[rand(major_i.size)],rand(77) + 50,note_length[rand(note_length.size)])
    end
  
    1.times do
     section_1.add_notes(major_i[rand(major_i.size)],rand(77) + 50,note_length[rand(note_length.size)])
    end
  
    1.times do
     section_1.add_notes(major_i[rand(major_i.size)],rand(77) + 50,note_length[rand(note_length.size)])
    end
  
  end
  
  var 8 = I IV I V V I V I IV V V I ii I V vi ii I V I IV I IV I 
  
  1.times do 
  
    1.times do
     section_1.add_notes(major_i[rand(major_i.size)],rand(77) + 50,note_length[rand(note_length.size)])
    end
  
    1.times do
     section_1.add_notes(major_i[rand(major_i.size)],rand(77) + 50,note_length[rand(note_length.size)])
    end
  
    1.times do
     section_1.add_notes(major_i[rand(major_i.size)],rand(77) + 50,note_length[rand(note_length.size)])
    end
  
    1.times do
     section_1.add_notes(major_i[rand(major_i.size)],rand(77) + 50,note_length[rand(note_length.size)])
    end
  
    1.times do
     section_1.add_notes(major_i[rand(major_i.size)],rand(77) + 50,note_length[rand(note_length.size)])
    end
  
    1.times do
     section_1.add_notes(major_i[rand(major_i.size)],rand(77) + 50,note_length[rand(note_length.size)])
    end
  
  end
  
  var 9 = I V I IV ii I V I
  
  1.times do 
  
    1.times do
     section_1.add_notes(major_i[rand(major_i.size)],rand(77) + 50,note_length[rand(note_length.size)])
    end
  
    1.times do
     section_1.add_notes(major_i[rand(major_i.size)],rand(77) + 50,note_length[rand(note_length.size)])
    end
  
    1.times do
     section_1.add_notes(major_i[rand(major_i.size)],rand(77) + 50,note_length[rand(note_length.size)])
    end
  
    1.times do
     section_1.add_notes(major_i[rand(major_i.size)],rand(77) + 50,note_length[rand(note_length.size)])
    end
  
    1.times do
     section_1.add_notes(major_i[rand(major_i.size)],rand(77) + 50,note_length[rand(note_length.size)])
    end
  
    1.times do
     section_1.add_notes(major_i[rand(major_i.size)],rand(77) + 50,note_length[rand(note_length.size)])
    end
  
  end
  
  var 10 = I V I ii I V I
  
  1.times do 
  
    1.times do
     section_1.add_notes(major_i[rand(major_i.size)],rand(77) + 50,note_length[rand(note_length.size)])
    end
  
    1.times do
     section_1.add_notes(major_i[rand(major_i.size)],rand(77) + 50,note_length[rand(note_length.size)])
    end
  
    1.times do
     section_1.add_notes(major_i[rand(major_i.size)],rand(77) + 50,note_length[rand(note_length.size)])
    end
  
    1.times do
     section_1.add_notes(major_i[rand(major_i.size)],rand(77) + 50,note_length[rand(note_length.size)])
    end
  
    1.times do
     section_1.add_notes(major_i[rand(major_i.size)],rand(77) + 50,note_length[rand(note_length.size)])
    end
  
    1.times do
     section_1.add_notes(major_i[rand(major_i.size)],rand(77) + 50,note_length[rand(note_length.size)])
    end
  
  end
  
  var 11 = I V V I V I IV V V I ii I V I ii I V I IV I 
  
  1.times do 
  
    1.times do
     section_1.add_notes(major_i[rand(major_i.size)],rand(77) + 50,note_length[rand(note_length.size)])
    end
  
    1.times do
     section_1.add_notes(major_i[rand(major_i.size)],rand(77) + 50,note_length[rand(note_length.size)])
    end
  
    1.times do
     section_1.add_notes(major_i[rand(major_i.size)],rand(77) + 50,note_length[rand(note_length.size)])
    end
  
    1.times do
     section_1.add_notes(major_i[rand(major_i.size)],rand(77) + 50,note_length[rand(note_length.size)])
    end
  
    1.times do
     section_1.add_notes(major_i[rand(major_i.size)],rand(77) + 50,note_length[rand(note_length.size)])
    end
  
    1.times do
     section_1.add_notes(major_i[rand(major_i.size)],rand(77) + 50,note_length[rand(note_length.size)])
    end
  
  end
  
  var 12 = I ii iv IV V I IV vi I IV I 
  
  1.times do 
  
    1.times do
     section_1.add_notes(major_i[rand(major_i.size)],rand(77) + 50,note_length[rand(note_length.size)])
    end
  
    1.times do
     section_1.add_notes(major_i[rand(major_i.size)],rand(77) + 50,note_length[rand(note_length.size)])
    end
  
    1.times do
     section_1.add_notes(major_i[rand(major_i.size)],rand(77) + 50,note_length[rand(note_length.size)])
    end
  
    1.times do
     section_1.add_notes(major_i[rand(major_i.size)],rand(77) + 50,note_length[rand(note_length.size)])
    end
  
    1.times do
     section_1.add_notes(major_i[rand(major_i.size)],rand(77) + 50,note_length[rand(note_length.size)])
    end
  
    1.times do
     section_1.add_notes(major_i[rand(major_i.size)],rand(77) + 50,note_length[rand(note_length.size)])
    end
  
  end

=end  
  
  
