require 'test_helper'

class URLTest < Minitest::Test
  def test_get_general
    VCR.use_cassette('url_general') do
      url = OTX::URL.new('test_api')

      u = url.get_general('http://www.fotoidea.com/sport/4x4_san_ponso/slides/IMG_0068.html')

      assert_equal 'http://www.fotoidea.com/sport/4x4_san_ponso/slides/IMG_0068.html', u.indicator
      assert_equal 'http://www.alexa.com/siteinfo/fotoidea.com', u.alexa
      assert_equal 'http://whois.domaintools.com/fotoidea.com', u.whois
      assert_equal 'www.fotoidea.com', u.hostname
      assert_equal 'fotoidea.com', u.domain
      assert_equal 'url', u.type
      assert_equal 'URL', u.type_title
    end
  end

  def test_get_url_list
    VCR.use_cassette('url_url_list') do
      url = OTX::URL.new('test_api')

      u = url.get_url_list('http://www.fotoidea.com/sport/4x4_san_ponso/slides/IMG_0068.html')

      assert_equal 'http://www.fotoidea.com/sport/4x4_san_ponso/slides/IMG_0068.html', u.first.url
      assert_equal 1403816077.0, u.first.secs
      assert_equal true, u.first.deep_analysis
      assert_equal 'http://www.fotoidea.com/sport/4x4_san_ponso/slides/IMG_0068.html', u.last.url
      assert_equal 1403801671.0, u.last.secs
      assert_equal true, u.last.deep_analysis
    end
  end
end
