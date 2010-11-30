# Creating a Scale and chord based System 
require 'midilib'
require 'rubymusicengine'
require 'scales'


song=MIDI::Sequence.new

song.track << (melody = TimedTrack.new(0, song))
song.track << (progression = TimedTrack.new(1,song))

melody.instrument = 56
progression.instrument = 19

melody.events << MIDI::Tempo.new(MIDI::Tempo.bpm_to_mpq(120))

interval = [-5,-1,0,4,7]

note=0

(8*4).times do |i| note += interval[rand(interval.size)]
  note =0 if note < -39 or notes > 48
  
  
  note = intervals[rand(intervals.size)]-60

  note = 0 if note < -39 or note > 48

  melody.add_notes(note, 127, duration[rand(duration.size)].to_s)
  puts note 
  end

  open('random5.mid','w'){|f| song.write(f)}