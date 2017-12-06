require 'test_helper'

class FilesTest < Minitest::Test
  def test_get_general
    VCR.use_cassette('file_general') do
      file = OTX::File.new('test_api')

      f = file.get_general('6c5360d41bd2b14b1565f5b18e5c203cf512e493')

      assert_equal '6c5360d41bd2b14b1565f5b18e5c203cf512e493', f.indicator
      assert_equal 'sha1', f.type
      assert_equal 0, f.pulse_info.count
      assert_equal 'FileHash-SHA1', f.type_title
    end
  end

  def test_get_analysis
    VCR.use_cassette('file_analysis') do
      file = OTX::File.new('test_api')

      f = file.get_analysis('6c5360d41bd2b14b1565f5b18e5c203cf512e493')

      assert_equal 'PEXE', f.page_type
      assert_equal '570f8d369d7ca60a650c6f8d', f.analysis['_id']
    end
  end
end
