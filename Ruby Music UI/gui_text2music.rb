require 'rubygems'
require 'midilib'
require 'tk'
require 'rubymusicengine'

def make_song(var1,var2)
 converted=[]
 var1.each_byte {|t|converted << t}
 converted.to_midi("#{var2.to_s}"+".mid")
 puts "song made"
 puts var1
 puts "#{converted}"
end

root = TkRoot.new
root.title = "Text to Music"

TkCanvas.new(root) do |canvas|
 width 195
 height 200
 # this creates a background image for the app
 
 image = TkPhotoImage.new
 image.file = "newskin.gif"
  
   label = TkLabel.new(root) 
      label.image = image
      label.place('height' => image.height, 
      'width' => image.width,'x' => 0, 'y' => 0)

 pack('side'=>'top','fill'=>'both')
 
# collects the text to be converted...  
entry1 = TkEntry.new(root)
var1 = TkVariable.new
entry1.textvariable = var1
var1.value = "Enter any text"
entry1.place('height' => 100,
              'width'  => 130,
              'x'      => 35,
              'y'      => 100)
              
entry2 = TkEntry.new(root)
var2 = TkVariable.new
entry2.textvariable = var2
var2.value = "title composition"
entry2.place('height' => 25,
              'width'  => 130,
              'x'      => 35,
              'y'      => 50)          
              
# designs the button that converts text 2 midi
root = TkRoot.new
btn_Convert = TkButton.new(root) do
 image TkPhotoImage.new('file' => 'rec.gif')
  state "normal"
  cursor "watch"
  command (proc {make_song(var1.to_s,var2.to_s)})
  pack("side" => "right",  "padx"=> "50", "pady"=> "10")
end
  
end

Tk.mainloop