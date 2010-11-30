# build Menu List of Scales

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
"(54) chinese\n"



# create interval logic here 
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

# create the elsif 



