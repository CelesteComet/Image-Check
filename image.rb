require 'phashion'

img1 = Phashion::Image.new('img.png')
img2 = Phashion::Image.new('imgtest1.png')
puts img1.duplicate?(img2)
puts img1.distance_from(img2)
