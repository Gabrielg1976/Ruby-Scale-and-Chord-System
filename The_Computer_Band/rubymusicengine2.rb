# This is going to be a muilti-channel system: 4 channel is the first goal. 

require 'midilib'
class Array
  
  def to_midi(file, note_length=["8th","quarter","half","whole","16th","32nd"]) 
    midi_max = 128.0
    midi_min = 0.0
    low, high = min, max
    
    song = MIDI::Sequence.new
    
    song.tracks << (melody = MIDI::Track.new(song))
    song.tracks << (bass = MIDI::Track.new(song))
    
    # melody Section 
    melody.events << MIDI::Tempo.new(MIDI::Tempo.bpm_to_mpq(120))
    melody.events << MIDI::ProgramChange.new(0, 34)
    
    # bass Section
    bass.events << MIDI::Tempo.new(MIDI::Tempo.bpm_to_mpq(120))
    bass.events << MIDI::ProgramChange.new(1, 66)
    
    
    each do |number|
     midi_note = (midi_min + ((number-midi_min) * (midi_max-low)/high)).to_i
     
     melody.events << MIDI::NoteOnEvent.new(0, midi_note, 127, 0)
     melody.events << MIDI::NoteOffEvent.new(0, midi_note, 127, song.note_to_delta(note_length[rand(note_length.size)]))
      
     bass.events << MIDI::NoteOnEvent.new(1, midi_note, 127, 0)
     bass.events << MIDI::NoteOffEvent.new(1, midi_note, 127, song.note_to_delta(note_length[rand(note_length.size)]))
      
      
      end
       open(file, 'w') { |f| song.write(f) }
  end
end