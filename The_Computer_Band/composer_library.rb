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

def minor_vii(low_note, velocity=127, duration='quarter')
 add_notes(11, 14, 17].collect { |x| x + low_note }, velocity, duration)
end

# build advance chord system for 7th 9th 11th ect.. 

major_9th=[]
major_7th=[]
major_jazz_7th=[]
major_blues_7th=[]
major_11th=[]
major_13th=[]
augmented=[]
dimished=[]

# chord Methods 


 # 54 Basic Scales 
 
 #    This program is distributed in the hope that it will be useful,
 #    but WITHOUT ANY WARRANTY; without even the implied warranty of
 #    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 #    GNU Affero General Public License for more details.
 #    You should have received a copy of the GNU Affero General Public License
 #    along with this program.  If not, see <http://www.gnu.org/licenses/>.

 # Listed Compiled by Gabriel D Garrod written for live ruby coding midi systems 
 # Note References & each scale is now a method 

 
 def duration
   duration=[ 1,0.75,0.50,0.25 ,0.125,0.0625]
 end

 # Create a second Pattern Page that sets C=0
 # 54 Scales in the Chart Below
 def chromatic
  chromatic=[60,61,62,63,64,65,66,67,68,69,70,71,72] # C Db D Eb E F Gb G Ab A  Bb B  C
 end
 def spanish_8_tone
  spanish_8_tone=[60,61,63,64,65,66,68,70,72]# C Db Eb E F Gb Ab Bb C
 end
 def flamenco
  flamenco=[60,61,63,64,65,67,68,70,72]# C Db Eb E F G Ab Bb C
 end
 def symmetrical
  symmetrical=[60,61,63,64,66,67,69,70,72]# C Db Eb E Gb G A Bb C
 end
 def diminished
  diminished=[60,62,63,65,66,68,69,71,72]# C D Eb F Gb Ab A B C
 end
 def whole_tone
  whole_tone=[60,62,63,66,68,70,72]# C D E Gb Ab Bb C
 end
 def augmented
  augmented=[60,63,64,67,68,72]# C Eb E G Ab  C
 end
 def three_semitone
  three_semitone=[60,63,66,69,72]# C Eb Gb A C
 end
 def four_semitone
  four_semitone=[60,64,68,72]# C E Ab C
 end
 def ultra_locrian
  ultra_locrian=[60,61,63,66,68,69,72]# C Db Eb E Gb Ab A C
 end
 def super_locrian
  super_locrian=[60,61,63,64,66,68,70,72]# C Db Eb E Gb Ab Bb C
 end
 def indian_ish
  indian_ish=[60,61,63,64,67,68,70,72]# C Db Eb E G Ab Bb C
 end
 def locrian
  locrian=[60,61,63,65,66,68,70,72]# C Db Eb F Gb Ab Bb C
 end
 def phrygian
  phrygian=[60,61,63,65,67,68,70,72]# C Db Eb F G  Ab Bb C 
 end
 def neapolitan_min
  neapolitan_min=[60,61,63,65,67,68,71,72]#  C Db Eb F G Ab B C
 end
 def javanese
  javanese=[60,61,63,65,67,69,70,72]# C Db Eb F G A Bb C
 end
 def neapolitan_maj
  neapolitan_maj=[60,61,63,67,69,69,71,72]#  C Db Eb F G A B C
 end
 def todi
  todi=[60,61,63,66,67,68,71,72]# C Db Eb Gb G Ab B C
 end
 def persian
  persian=[60,61,64,65,68,70,71,72]# C Db E F Gb Ab B C
 end
 def oriental
  oriental=[60,61,64,65,66,69,70,72]# C Db E F Gb A Bb C
 end
 def maj_phryg
  maj_phryg=[60,61,64,65,66,68,70,72]# C Db E F G Ab Bb C  
 end
 def double_harmonic
  double_harmonic=[60,61,64,65,68,71,72]# C Db E F G Ab B C    
 end
 def marva
  marva=[60,61,64,66,67,69,71,72]# C Db E Gb G A B C
 end
 def enigmatic
  enigmatic=[60,61,64,66,68,70,71,72]# C Db E Gb Ab Bb B C
 end
 def locrian_natural
  locrian_natural=[60,62,63,65,66,68,70,72]# C D Eb F Gb Ab Bb C
 end
 def minor
  minor=[60,62,63,65,67,68,70,72]# (natural)C D Eb F G Ab Bb C                
 end
 def harmonic_minor
  harmonic_minor=[60,62,63,65,67,68,71,72]# C D Eb F G Ab B C                  
 end
 def dorian
  dorian=[60,62,63,65,67,69,70,72]# C D Eb F G A Bb C
 end
 def melodic_minor
  melodic_minor=[60,62,63,65,67,69,71,72]# C D Eb F G A B C                  
 end
 def hungarian_gypsy
  hungarian_gypsy =[60,62,63,66,67,68,70,72]# C D Eb Gb G Ab Bb C
 end
 def hungarian_minor
  hungarian_minor=[60,62,63,66,67,68,71,72]# C D Eb Gb G Ab B C                
 end
 def romanian
  romanian=[60,62,63,66,67,69,70,72]# C D Eb Gb G A Bb C
 end
 def maj_locrian
  maj_locrian=[60,62,64,65,66,68,70,72]# C  D  E  F  Gb Ab Bb C
 end
 def hindu
  hindu=[60,62,64,65,67,68,70,72]# C  D  E  F  G  Ab Bb C  
 end
 def ethiopian
  ethiopian=[60,62,64,65,67,68,70,71,72]# C  D  E  F  G  Ab B  C 
 end
 def mixolydian
  mixolydian=[60,62,64,65,67,69,70,72]# C  D  E  F  G  A  Bb C  
 end
 def major
  major=[60,62,64,65,67,69,71,72]# C  D  E  F  G  A  B  C  
 end
 def mixolydian_aug
  mixolydian_aug=[60,62,64,65,68,70,72]# C  D  E  F  Ab A  Bb C  
 end
 def harmonic_major
  harmonic_major=[60,62,64,65,68,69,71,72]# C  D  E  F  Ab A  B  C  
 end
 def lydian_min
  lydian_min=[60,62,64,66,67,68,70,72]# C  D  E  Gb G  Ab Bb C  
 end
 def lydian_dominant
  lydian_dominant=[60,62,64,66,69,70,72]#C  D  E  Gb G  A  Bb C
 end
 def lydian
  lydian=[60,62,64,66,67,69,71,72]# C  D  E  Gb G  A  B  C  
 end
 def lydian_aug
  lydian_aug=[60,62,64,66,68,69,70,72]# C  D  E  Gb Ab A  Bb C  
 end
 def leading_whole_tone
  leading_whole_tone=[60,62,64,66,68,70,71,72]#   C  D  E  Gb Ab Bb B  C  
 end
 def bluesy
  bluesy=[60,63,64,65,67,69,70,72]# C  Eb E  F  G  A  Bb C  
 end
 def hungarian_major
  hungarian_major=[60,63,64,66,67,69,70,72]# C  Eb E  Gb G  A  Bb C 
 end
 def pelog
  pelog=[60,61,63,67,70,72]# C  Db Eb G  Bb C  
 end
 def iwato
  iwato=[60,61,65,66,70,72]# C  Db F  Gb Bb C 
 end
 def japanese
  japanese=[60,61,65,67,68,72]# C  Db F  G  Ab C 
 end
 def hirajoshi
  hirajoshi=[60,62,63,67,68,72]# C  D  Eb G  Ab C 
 end
 def pentatonic_major
  pentatonic_major=[60,62,64,67,69,72]# C  D  E  G  A  C  
 end
 def egyptian
  egyptian=[60,62,65,67,70,72]# C  D  F  G  Bb C  
 end
 def pentatonic_minor
  pentatonic_minor=[60,63,65,67,70,72]# C  Eb F  G  Bb C  
 end
 def chinese
  chinese=[60,64,66,67,71,72]# C  E  Gb G  B  C  
 end