require 'test_helper'

class URLTest < Minitest::Test
  def test_get_general
    VCR.use_cassette('url_general') do
      url = OTX::URL.new('test_api')

      url_general = url.get_general('http://www.fotoidea.com/sport/4x4_san_ponso/slides/IMG_0068.html')
    end
  end

  def test_get_url_list
    VCR.use_cassette('url_url_list') do
      url = OTX::URL.new('test_api')

      url_url_list = url.get_url_list('http://www.fotoidea.com/sport/4x4_san_ponso/slides/IMG_0068.html')
    end
  end
end
