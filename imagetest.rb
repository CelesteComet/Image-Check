gem 'minitest'
require 'minitest/autorun'
require 'phashion'


class ImageTest < Minitest::Test

  def check_images(img1, img2, true_or_false, description)
    img1 = Phashion::Image.new(img1)
    img2 = Phashion::Image.new(img2)
    print description + ":" + img1.distance_from(img2).to_s
    assert_equal true_or_false, img1.duplicate?(img2)
  end

  def test_two_similar_images_slightly_cropped
    img1 = Phashion::Image.new('img/beowulf1.png')
    img2 = Phashion::Image.new('img/beowulf2.png')
    puts "Two Similar Images (slight crop): " + img1.distance_from(img2).to_s
    assert_equal true, img1.duplicate?(img2)
  end

  def test_two_similar_icons
    check_images("img/orange_icon1.png", "img/orange_icon2.png", true, "Two Similar Icons")
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
    puts "Blue Paper VS Blue Hand: " + img1.distance_from(img2).to_s
    assert_equal false, img1.duplicate?(img2)
  end

  def two_black_and_white_small_line_icons
    img1 = Phashion::Image.new('img/bw_small_line_house_icon.png')
    img2 = Phashion::Image.new('img/bw_small_pencil_line_icon.png')
    puts "Black Line Based Icon vs White Line Based Icon: " + img1.distance_from(img2).to_s
    assert_equal false, img1.duplicate?(img2)
  end

  def test_same_image_jpeg_vs_png
    check_images("img/beowulf_big_jpg.jpg", "img/beowulf_big_png.png", true, "Same Image But JPEG VS PNG")
  end

end




