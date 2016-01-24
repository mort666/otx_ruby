$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'otx_ruby'

require 'minitest/autorun'
require 'webmock/minitest'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = "test/fixtures"
  c.hook_into :webmock

  c.before_record do |i|
     i.request.headers.delete('X-OTX-API-KEY')
     i.request.headers.delete('X-Otx-Api-Key')
  end
end
