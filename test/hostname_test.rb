require 'test_helper'

class HostnameTest < Minitest::Test
  def test_get_general
    VCR.use_cassette('hostname_general') do
      hostname = OTX::Hostname.new('test_api')

      hostname_general = hostname.get_general('mail.vspcord.com')
    end
  end

  def test_get_geo
    VCR.use_cassette('hostname_geo') do
      hostname = OTX::Hostname.new('test_api')

      hostname_geo = hostname.get_geo('mail.vspcord.com')
    end
  end

  def test_get_malware
    VCR.use_cassette('hostname_malware') do
      hostname = OTX::Hostname.new('test_api')

      hostname_malware = hostname.get_malware('mail.vspcord.com')
    end
  end

  def test_get_url_list
    VCR.use_cassette('hostname_url_list') do
      hostname = OTX::Hostname.new('test_api')

      hostname_url_list = hostname.get_url_list('mail.vspcord.com')
    end
  end

  def test_get_passive_dns
    VCR.use_cassette('hostname_passive_dns') do
      hostname = OTX::Hostname.new('test_api')

      hostname_passive_dns = hostname.get_passive_dns('mail.vspcord.com')
    end
  end

  def test_get_http_scans
    VCR.use_cassette('hostname_http_scans') do
      hostname = OTX::Hostname.new('test_api')

      hostname_http_scans = hostname.get_http_scans('mail.vspcord.com')
    end
  end
end
