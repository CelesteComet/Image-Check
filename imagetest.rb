gem 'minitest'
require 'minitest/autorun'
require 'phashion'




class ImageTest < Minitest::Test
=begin
  def test_same_icon
    assert_equal '08:00', Clock.at(8).to_s
    assert_equal '09:00', Clock.at(9).to_s
  end
=end

  def test_two_similar_images
    img1 = Phashion::Image.new('img/beowulf1.png')
    img2 = Phashion::Image.new('img/beowulf2.png')
    puts "Two Similar Images: " + img1.distance_from(img2).to_s
    assert_equal true, img1.duplicate?(img2)
  end

  def test_two_different_complex_images
    img1 = Phashion::Image.new('img/beowulf1.png')
    img2 = Phashion::Image.new('img/green_man1.png')
    puts "Two Different Complex Images: " + img1.distance_from(img2).to_s
    assert_equal false, img1.duplicate?(img2)
  end

  def test_two_of_the_same_exact_image
    img1 = Phashion::Image.new('img/green_man1.png')
    img2 = Phashion::Image.new('img/green_man1.png')
    puts "Two Same Exact Images: " + img1.distance_from(img2).to_s
    assert_equal true, img1.duplicate?(img2)
  end 

  def test_cropped_duck_vs_full_duck
    img1 = Phashion::Image.new('img/duck_full1.png')
    img2 = Phashion::Image.new('img/duck_cropped1.png')
    puts "Cropped Duck vs Full Duck: " + img1.distance_from(img2).to_s
    assert_equal false, img1.duplicate?(img2)
  end

  def test_different_colors_and_patterns
    img1 = Phashion::Image.new('img/tile_black_paper1.png')
    img2 = Phashion::Image.new('img/icon_paper.png')
    puts "Different Colors and Patterns: " + img1.distance_from(img2).to_s
    assert_equal false, img1.duplicate?(img2)
  end

  def test_white_arrow_vs_white_paper
    # Is failing the test, may need to lower hamming distance
    img1 = Phashion::Image.new('img/white_arrow.png')
    img2 = Phashion::Image.new('img/white_pencil_clip1.png')
    puts "White Arrow vs White Paper Icon: " + img1.distance_from(img2).to_s
    assert_equal false, img1.duplicate?(img2)
  end

  def test_blue_paper_vs_blue_hand_icon
    img1 = Phashion::Image.new('img/icon_hand.png')
    img2 = Phashion::Image.new('img/icon_paper.png')
    puts "White Arrow vs White Paper Icon: " + img1.distance_from(img2).to_s
    assert_equal false, img1.duplicate?(img2)
  end

end




