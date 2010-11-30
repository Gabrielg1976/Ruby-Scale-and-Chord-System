require 'rubygems'
require 'midilib'
require 'scales'
require 'chord_library_system'

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
