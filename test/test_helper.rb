$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'otx_ruby'

require 'minitest/autorun'
require 'webmock/minitest'
require 'vcr'
require 'byebug'

VCR.configure do |c|
  c.cassette_library_dir = "test/fixtures"
  c.hook_into :webmock

  c.before_record do |i|
     i.request.headers.delete('X-OTX-API-KEY')
     i.request.headers.delete('X-Otx-Api-Key')
     i.response.headers.delete('Set-Cookie')
  end
end
