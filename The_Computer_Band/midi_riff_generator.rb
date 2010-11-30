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
  
	  private

	  def event(event)
	    @events << event
	   event.time_from_start = @time
	  end
end

note_length=["8th","quarter","half","whole"]

song = MIDI::Sequence.new

 # How the tracks are created you can add as many has you like manual here 

 song.tracks << (melody = TimedTrack.new(0, song ))
 
  melody.instrument = 34 # 
  melody.name = "Riff"
  melody.events << MIDI::Tempo.new(MIDI::Tempo.bpm_to_mpq(100))

# Creates the riff patterns



riff_1=[]
riff_2=[]
super_riff=[]

10.times do 

11.times do
riff_1 << enigmatic[rand(enigmatic.size)]
end

5.times do 
 riff_2 << enigmatic[rand(enigmatic.size)]
end

4.times do
 super_riff << riff_1
end

2.times do 
 super_riff << riff_2
end

end

super_riff.each do |n|
   # Reset to middle C if we go out of the MIDI range 
   melody.add_notes(n,rand(127)+50,note_length[rand(note_length.size)])
end

open("midi_riff.mid",'w') { |f| song.write(f) }