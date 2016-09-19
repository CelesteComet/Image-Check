gem 'minitest'
require 'minitest/autorun'
require_relative 'SURF-image-detection.rb'

include OpenCV

class ImageTest < Minitest::Test

  def check_images(img1, img2, true_or_false, description)
    puts "#{description}"
    assert_equal true_or_false, FeatureSurfDetection::Image.similar?(img1,img2)
  end

  def test_two_similar_images_slightly_cropped
    check_images('img/beowulf1.png', 'img/beowulf2.png', true, "Two same images but slightly cropped:")
  end

  def test_two_similar_icons
    check_images('img/gray_realize_small1.png', 'img/gray_realize_small2.png', true, "Two similar icons:")
  end

  def test_two_of_the_same_exact_image
    check_images('img/blue_unit2.png', 'img/blue_unit2.png', true, "Two same exact images:")
  end 

  def test_two_different_complex_images
    check_images('img/beowulf1.png', 'img/green_man1.png', false, "Two completely different images:")
  end

  def test_cropped_duck_vs_full_duck
    check_images('img/duck_cropped1.png', 'img/duck_full1.png', false, "Cropped duck vs full duck:")
  end

  def test_different_colors_and_patterns
    check_images('img/tile_orange_checkmark1.png', 'img/tile_black_paper1.png', false, "Different colors and patterns:")
  end

  def test_white_arrow_vs_white_paper
    check_images('img/white_arrow.png', 'img/white_pencil_clip1.png', false, "Different colors and patterns:")
  end

  def test_blue_paper_vs_blue_hand_icon
    check_images('img/icon_hand.png', 'img/icon_paper.png', false, "Blue paper icon vs blue hand icon:")
  end

  def two_black_and_white_small_line_icons
    check_images('img/bw_small_line_house_icon.png', 'img/bw_small_pencil_line_icon.png', false, "Blue paper icon vs blue hand icon:")
  end

  def test_same_image_jpeg_vs_png
    check_images("img/beowulf_big_jpg.jpg", "img/beowulf_big_png.png", true, "Same Image But JPEG VS PNG")
  end

  def test_same_but_unit_number_different
    check_images("img/blue_unit2.png", "img/blue_unit3.png", false, "Same icon but unit number different:")
  end

  def test_flipped_images
    check_images("img/blue_unit3.png", "img/blue_unit3flipped.png", false, "Same icon but flipped:")
  end

end




