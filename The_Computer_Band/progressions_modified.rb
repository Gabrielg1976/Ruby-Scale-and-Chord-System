=begin 

This is a Modifed version of progressions.rb application.  

Concept and Design by Gabriel Garrod ( GDG Software Designs LLC )
Last Updated: 09/18/2010 

Email: GDGSoftwaredesigns@gmail.com 
facebook.com/gabrielgarrod
twitter.com/alphacore

This is Music Generating Application that allows user to create a song based off choosing a scale and the tempo
This application will allow users to choose a chord progression pattern to follow
Users will be able to choose

54 scale library to choose from  
21 Standard Chords + Power Chords and intervals   

New Features: 09/19/2010 

added a user selected scale system logic w/menu.( user can select from list of 54 scales )
added the ablity to change the key of the composition.

::: Current Features :::

 54 scale library to choose from  
 21 Standard Chords + Power Chords and intervals   

* User names the composition
* User choose the tempo
* User chooses the scale of composition. 
* User choose the key of the composition.
 
Lastest update:  9/20/2010 
Number of Lines: 434 lines
File Size:(k)

notes: Fixed the core logic of the arpeggition system
rebuilding the chord structure core logic removed the chords from the timetrack class 

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

# used to set the scale choosen by the User
scale_num=0

# this is the TimedTrack Class and All its Logic 

class TimedTrack < MIDI::Track
  
	  MIDDLE_C = 60
	  @@channel_counter=0
	  interval=[]

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
	  
	  # Build a A chord Library with all major and minor chord patterns 

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

    # chord sus 7th
    def add_sus_7th(low_note, velocity=127, duration='quarter')
      add_notes([0, 5, 7,10].collect { |x| x + low_note }, velocity, duration)
     end

     # chord sus 6/7th
     def add_sus_6th_7th(low_note, velocity=127, duration='quarter')
       add_notes([0, 5, 7,9,10].collect { |x| x + low_note }, velocity, duration)
      end

      # chord sus 7/11th 
      def add_sus_7th_11th(low_note, velocity=127, duration='quarter')
        add_notes([0, 5, 7,10,17].collect { |x| x + low_note }, velocity, duration)
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

    # Idea Based around key of C each of the chord patterns start with C on 0. 

    def major_i(low_note, velocity=127, duration='quarter')
     add_notes([0, 4, 7].collect { |x| x + low_note }, velocity, duration)
    end

    def minor_ii(low_note, velocity=127, duration='quarter')
     add_notes([2, 5, 9].collect { |x| x + low_note }, velocity, duration)
    end

    def minor_iii(low_note, velocity=127, duration='quarter')
     add_notes([4, 7, 11].collect { |x| x + low_note }, velocity, duration)
    end

    def major_iv(low_note, velocity=127, duration='quarter')
     add_notes([5, 9,12].collect { |x| x + low_note }, velocity, duration)
    end

    def major_v(low_note, velocity=127, duration='quarter')
     add_notes([7,11,14].collect { |x| x + low_note }, velocity, duration)
    end

    def minor_vi(low_note, velocity=127, duration='quarter')
     add_notes([9, 12, 16].collect { |x| x + low_note }, velocity, duration)
    end

    def minor_vii(low_note, velocity = 127, duration='quarter')
     add_notes([11,14,17].collect { |x| x + low_note }, velocity, duration)
    end

  	   # Custom Power Chord Patterns 

  	def power_chord(low_note,velocity=127,duration='quarter')
  	 add_notes([0,7].collect { |x| x + low_note }, velocity, duration)
    end

    def power_4th(low_note,velocity=127,duration='quarter')
      add_notes([0,5].collect {|x|x + low_note },velocity, duration)
    end

    def power_6th
      (low_note,velocity=127,duration='quarter')
        add_notes([0,9].collect {|x|x + low_note },velocity, duration)
    end

    def power_7th(low_note,velocity=127,duration='quarter')
      add_notes([0,11].collect {|x|x + low_note },velocity, duration)
    end

    def power_9th(low_note,velocity=127,duration='quarter')
      add_notes([0,14].collect {|x|x + low_note },velocity, duration)
    end

    def power_11th(low_note,velocity=127,duration='quarter')
      add_notes([0,17].collect {|x|x + low_note },velocity, duration)
    end

    def power_13th(low_note,velocity=127,duration='quarter')
      add_notes([0,21].collect {|x|x + low_note },velocity, duration)
    end
  
	  private

	  def event(event)
	    @events << event
	   event.time_from_start = @time
	  end
end

# ::::::::::::::::::::::::::::::::::::::::::::::::::::::
# The Menu System and Interface to the logic # # # # # # 
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::




begin
  
puts " Progressions Composer \n"  
  
# ask and Lets user name the composition.
puts " What is the name of your composition ? \n"
title=gets.chomp!

puts "what key would you like the composition ?"
puts "(1) = C\n"+"(2) = Db\n"+"(3) = Eb\n"+"(4) = E\n"+"(5) = F\n"+"(6) = Gb\n"+
"(7) = G\n"+"(8) = Ab\n"+"(9) = A\n"+"(10) = Bb\n"+"(11) = B\n"

key = gets.to_i

# ask user to choose the tempo of the composition.
puts "what is the tempo of this composition ? \n "
tempo=gets.to_i

# lets user choose the scale used in the composition.
puts "Enter the Scales Number you like to use ? \n\n"
puts "(1) chromatic\n"+  
"(2) spanish__tone\n"+ 
"(3) flamenco\n"+ 
"(4) symmetrical\n"+ 
"(5) diminished\n"+
"(6) whole_tone\n"+
"(7) augmented\n"+
"(8) three_semitone\n"+
"(9) four_semitone\n"+
"(10) ultra_locrian\n"+
"(11) super_locrian\n"+
"(12) indian_ish\n"+
"(13) locrian\n"+
"(14) phrygian\n"+
"(15) neapolitan_min\n"+ 
"(16) javanese\n"+
"(17) neapolitan_maj\n"+
"(18) todi\n"+ 
"(19) persian\n"+
"(20) oriental\n"+
"(21) maj_phryg\n"+
"(22) double_harmonic\n"+ 
"(23) marva\n"+ 
"(24) enigmatic\n"+ 
"(25) locrian_natural\n"+
"(26) minor\n"+ 
"(27) harmonic_minor\n"+ 
"(28) dorian\n"+ 
"(29) melodic_minor\n"+
"(30) hungarian_gypsy\n"+ 
"(31) hungarian_minor\n"+ 
"(32) romanian\n"+ 
"(33) maj_locrian\n"+ 
"(34) hindu\n"+ 
"(35) ethiopian\n"+ 
"(36) mixolydian\n"+ 
"(37) major\n"+
"(38) mixolydian_aug\n"+
"(39) harmonic_major\n"+ 
"(40) lydian_min\n"+  
"(41) lydian_dominant\n"+
"(42) lydian\n"+ 
"(43) lydian_aug\n"+  
"(44) leading_whole_tone\n"+ 
"(45) bluesy\n"+   
"(46) hungarian_major\n"+  
"(47) pelog\n"+   
"(48) iwato\n"+  
"(49) japanese\n"+
"(50) hirajoshi\n"+
"(51) pentatonic_major\n"+  
"(52) egyptian\n"+
"(53) pentatonic_minor\n"+  
"(54) chinese"

scale_num = gets.to_i

end
#  ::::::::::::::::::::::::::::
# menu system ends # # # # # # 
#  :::::::::::::::::::::::::::


# This can be taken all the way to 128th 
note_length=["8th","quarter","half","whole"]

# builds the logic for choosing the correct scale when ask by the user ( I know Really Messy but works )# # #

if scale_num == 1
  interval = chromatic  
 elsif scale_num == 2
  interval = spanish__tone
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

  
  # Arppeggition system core Logic ::::::::::::::
 #::::::::::::::::::::::::::::::::::::::::::::::

begin
maj_i_arp=[]
min_ii_arp=[]
min_iii_arp=[]
maj_iv_arp=[]
maj_v_arp=[]
min_vi_arp=[]
min_vii_arp=[]
   
# Builds each of the chords based on the scale choosen by user.
# major i
maj_i_arp << interval[0] << interval[2] << interval[4]
# minor ii
min_ii_arp << interval[1] << interval[3] << interval[5]
# minor iii
min_iii_arp << interval[2]<< interval[4] << interval[6]
# major iv
maj_iv_arp << interval[3] << interval[5] << interval[0]
# major v
maj_v_arp << interval[4] << interval[6] << interval[1]
# minor vi 
min_vi_arp << interval[5] << interval[0] << interval[2]
# minor vii
min_vii_arp << interval[6] << interval[1] << interval[3]
end

 #Arpeggiation system ends
 #:::::::::::::::::::::::::::::::::::::::::::::::::::::

 #::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
 # Creates the Song object 
 #::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

begin
 song = MIDI::Sequence.new

 # How the tracks are created you can add as many has you like manual here 

 song.tracks << (melody = TimedTrack.new(0, song ))
 song.tracks << (harmony = TimedTrack.new(1, song ))
 song.tracks << (arp = TimedTrack.new(2, song ))

 # Chooses the channels Instrument
 melody.instrument = 34 # 
 harmony.instrument = 55
 arp.instrument = 00

 # Names the tracks
 melody.name = "Melody"
 harmony.name ="Harmony"
 arp.name ="Arp"

 melody.events << MIDI::Tempo.new(MIDI::Tempo.bpm_to_mpq(tempo))
 
end 
 
 # Sets the number of measure generated and the number of times notes are created 4*8 is equal to 8 measures
 # of music generated 
 # 24 * 4 = est 3 minute Song. 
 
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
 # Creates the Musical Composition
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::    
  
 8.times do 
    note = interval[rand(interval.size)] + key
    # Reset to middle C if we go out of the MIDI range 
    note = 0 + key if note < -39 + key or note > 48 + key
    harmony.major_i(note,rand(77) + 50,note_length[rand(note_length.size)])
    arp.add_notes(maj_i_arp[rand(maj_i_arp.size)],rand(127)+50,note_length[rand(note_length.size)])
    melody.add_notes(note,rand(127)+50,note_length[rand(note_length.size)])
    arp.add_notes(maj_i_arp[rand(maj_i_arp.size)],rand(127)+50,note_length[rand(note_length.size)])
    melody.add_notes(note,rand(127)+50,note_length[rand(note_length.size)])
 end



 
# Name a Generates the actual midi file.
open("#{title}"+".mid",'w') { |f| song.write(f) }