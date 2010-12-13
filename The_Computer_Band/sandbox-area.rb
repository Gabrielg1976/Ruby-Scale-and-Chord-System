tempo_range=[]
(40...200).each { |x| tempo_range << x }

5.times do
 puts tempo_range[rand(tempo_range.size)]
end
# # Build a A chord Library with all major and minor chord patterns Total Chords => ( 37 ) 
# # Based on The Root 
# add_major=[]
# add_minor=[]
# add_dmin=[]
# add_aug=[]
# add_sus=[]
# add_sus_7th=[]
# add_sus_6th_7th=[]
# add_sus_7th_11th=[]
# add_6th=[]
# add_minor_6th=[]
# add_7th=[]
# add_minor_7th=[]
# add_dim_7th=[]
# add_added9=[]
# add_9th=[]
# add_major_9th=[]
# add_minor_9th=[]
# add_major_11th=[]
# add_major_13th=[]
# major_i=[]
# minor_ii=[]
# minor_iii=[]
# major_iv=[]
# major_v=[]
# minor_vi=[]
# minor_vii=[]
# # set of powerchord varations
# power_4th=[]
# power_5th=[]
# power_6th=[]
# power_7th=[]
# power_9th=[]
# power_11th=[]
# power_13th=[]
# # Extra chords 
# major_II=[]
# minor_ii_dim=[]
# major_III=[]
# major_v_7th=[]
# 
# # dimished minor ii chord
# minor_ii_dim << interval[2] << interval[5] << interval[8]
# # V/7th chord 
# major_v_7th << interval[7] << interval[11] << interval[14] << interval[22]
# # Major II 
# major_II << interval[2] << interval[6] << interval[9]
# # Major III 
# major_III << interval[4] << interval[8] << interval[11]
# # major chord
# add_major << interval[0] << interval[4] << interval[7] 
# # minor chord
# add_minor << interval[0] << interval[3] << interval[7]
# # chord dimished
# add_dmin << interval[0] << interval[3] << interval[6]
# # chord augmented
# add_aug << interval[0] << interval[4] << interval[8]
# # chord sus
# add_sus << interval[0] << interval[5] << interval[7]
# # chord sus 7th
# add_sus_7th << interval[0] << interval[5] << interval[7] << interval[10]
# # chord sus 6/7th
# add_sus_6th_7th << interval[0]<< interval[5] << interval[7] << interval[9] << interval[10]
# # chord sus 7/11th 
# add_sus_7th_11th << interval[0]<< interval[4] << interval[7] << interval[10] << interval[17]
# # chord major 6th
# add_6th << interval[0] << interval[4] << interval[7] << interval[9]
# # chord minor 6th
# add_minor_6th << interval[0] <<interval[3] <<interval[7] <<interval[9] 
# # chord 7th
# add_7th << interval[0] << interval[4] << interval[7] << interval[10]
# # chord major 7th
# add_major_7th << interval[0] << interval[4] << interval[7] << interval[11]
# # chord minor 7th
# add_minor_7th << interval[0] << interval[3] << interval[7] << interval[10]
# # chord dimished 7th
# add_dim_7th << interval[0] << interval[3] << interval[6] << interval[9]
# # chord add 9
# add_added9  << interval[0] << interval[4] << interval[7] << interval[14]
# # chord  9th
# add_9th << interval[0] << interval[4] << interval[7] << interval[10] << interval[14]
# # chord major 9th
# add_major_9th << << interval[0] << interval[4] << interval[7] << interval[11] << interval[14]
# # chord minor 9th
# add_minor_9th << interval[0] << interval[3] << interval[7] << interval[11] << interval[14] 
# # chord major 11th
# add_major_11th << interval[0] << interval[4] << interval[7] << interval[10] << interval[14] << interval[17]
# # chord major 13th
# add_major_13th << interval[0] << interval[4] << interval[7] << interval[10] << interval[14] << interval[21]
# 
# # chord I
# major_i << interval[0] << interval[4] << interval[7]
# # chord ii
# minor_ii << interval[2] << interval[5] << interval[9] 
# # chord iii
# minor_iii << interval[4] << interval[7] << interval[11] 
# # chord IV
# major_iv << interval[5] << interval[9] << interval[12]
# # chord V
# major_v << interval[7] << interval[11] << interval[14]
# # chord vi
# minor_vi << interval[9] << interval[12] << interval[16]
# # chord vii
# minor_vii << interval[11] << interval[14] << interval[17]
# 
# # Custom Power Chord Patterns 
# power_5th << interval[0] << interval[7]
# power_4th << interval[0] << interval[5]
# power_6th << interval[0] << interval[9]
# power_7th << interval[0]<< interval[11]
# power_9th << interval[0]<< interval[14]
# power_11th << interval[0]<< interval[17]
# power_13th << interval[0]<< interval[21]
