require 'test_helper'

class ExportTest < Minitest::Test
  def test_get_export
    VCR.use_cassette('export_get') do
      export = OTX::Export.new('test_api')

      e = export.get_export

      assert_equal 'src.sandcastlesmagazine.com', e.first.indicator
      assert_equal '', e.first.description
      assert_equal '', e.first.title
      assert_equal '', e.first.content
      assert_equal 'hostname', e.first.type
      assert_equal 1, e.first.id
    end
  end

  #
  # These make giant af fixtures files...
  #
  # def test_get_all
  #   VCR.use_cassette('export_all') do
  #     export = OTX::Export.new('test_api')

  #     export_all = export.get_all
  #   end
  # end

  # def test_get_since
  #   VCR.use_cassette('export_since') do
  #     export = OTX::Export.new('test_api')

  #     export_since = export.get_since('2017-01-01T12:35:00+00:00')
  #   end
  # end
end
