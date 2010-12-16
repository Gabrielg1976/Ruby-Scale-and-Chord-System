require 'rubygems'
require 'midilib'
require 'tk'

root = TkRoot.new
root.title = "Algorithmic Machine Quartet"

TkCanvas.new(root) do |canvas|
  width 400
  height 200
  # this creates a background image for the app
  image = TkPhotoImage.new
  image.file = "newskin.gif"
  label = TkLabel.new(root) 
  label.image = image
  label.place('height' => image.height, 
  'width' => image.width,'x' => 0, 'y' => 0)
  pack('side'=>'top','fill'=>'both')
  
  # lets user allowed name the composition  
  
  entry2 = TkEntry.new(root)
  var2 = TkVariable.new
  entry2.textvariable = var2
  var2.value = "title composition"
  entry2.place('height' => 25,
                'width'  => 130,
                'x'      => 35,
                'y'      => 50)
  
end
 
Tk.mainloop