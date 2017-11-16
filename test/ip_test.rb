require 'test_helper'

class IPTest < Minitest::Test
  def test_get_general
    VCR.use_cassette('ip_general') do
      ip = OTX::IP.new('test_api')

      ip_general = ip.get_general('8.8.8.8')
    end
  end

  def test_get_reputation
    VCR.use_cassette('ip_reputation') do
      ip = OTX::IP.new('test_api')

      ip_reputation = ip.get_reputation('8.8.8.8')
    end
  end

  def test_get_geo
    VCR.use_cassette('ip_geo') do
      ip = OTX::IP.new('test_api')

      ip_geo = ip.get_geo('8.8.8.8')
    end
  end

  def test_get_malware
    VCR.use_cassette('ip_malware') do
      ip = OTX::IP.new('test_api')

      ip_malware = ip.get_malware('8.8.8.8')
    end
  end

  def test_get_url_list
    VCR.use_cassette('ip_url_list') do
      ip = OTX::IP.new('test_api')

      ip_url_list = ip.get_url_list('8.8.8.8')
    end
  end

  def test_get_passive_dns
    VCR.use_cassette('ip_passive_dns') do
      ip = OTX::IP.new('test_api')

      ip_passive_dns = ip.get_passive_dns('8.8.8.8')
    end
  end

  def test_get_http_scans
    VCR.use_cassette('ip_http_scans') do
      ip = OTX::IP.new('test_api')

      ip_http_scans = ip.get_http_scans('8.8.8.8')
    end
  end
end
