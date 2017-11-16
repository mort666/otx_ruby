require 'test_helper'

class FilesTest < Minitest::Test
  def test_get_general
    VCR.use_cassette('file_general') do
      file = OTX::File.new('test_api')

      file_general = file.get_general('6c5360d41bd2b14b1565f5b18e5c203cf512e493')
    end
  end

  def test_get_analysis
    VCR.use_cassette('file_analysis') do
      file = OTX::File.new('test_api')

      file_analysis = file.get_analysis('6c5360d41bd2b14b1565f5b18e5c203cf512e493')
    end
  end
end
