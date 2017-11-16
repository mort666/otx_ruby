require 'test_helper'

class ExportTest < Minitest::Test
  def test_get_export
    VCR.use_cassette('export_get') do
      export = OTX::Export.new('test_api')

      export_get = export.get_export
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
