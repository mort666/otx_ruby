require 'test_helper'

class HostnameTest < Minitest::Test
  def test_get_general
    VCR.use_cassette('hostname_general') do
      hostname = OTX::Hostname.new('2f6326698009066c406fc4db742b4c94c888b9b4ed7a4f2075471f25672981b6')

      h = hostname.get_general('otx.alienvault.com')

      assert_equal 'otx.alienvault.com', h.indicator
      assert_equal 'Hostname', h.type_title
      assert_equal 'alienvault.com', h.domain
      assert_equal 'hostname', h.type
      assert_equal 0, h.pulse_info.count
    end
  end

  def test_get_geo
    VCR.use_cassette('hostname_geo') do
      hostname = OTX::Hostname.new('2f6326698009066c406fc4db742b4c94c888b9b4ed7a4f2075471f25672981b6')

      h = hostname.get_geo('otx.alienvault.com')

      assert_equal '/static/img/flags/us.png', h.flag_url
      assert_equal 'Boardman', h.city
      assert_equal 'OR', h.region
      assert_equal 541, h.area_code
      assert_equal 'NA', h.continent_code
      assert_equal 'USA', h.country_code3
      assert_equal 'US', h.country_code
      assert_equal 'United States', h.country_name
      assert_equal 'United States', h.flag_title
      assert_equal 'AS16509 Amazon.com, Inc.', h.asn
      assert_equal 810, h.dma_code
      assert_equal '97818', h.postal_code
    end
  end

  def test_get_malware
    VCR.use_cassette('hostname_malware') do
      hostname = OTX::Hostname.new('2f6326698009066c406fc4db742b4c94c888b9b4ed7a4f2075471f25672981b6')

      h = hostname.get_malware('otx.alienvault.com')

      assert h.empty?
    end
  end

  def test_get_url_list
    VCR.use_cassette('hostname_url_list') do
      hostname = OTX::Hostname.new('2f6326698009066c406fc4db742b4c94c888b9b4ed7a4f2075471f25672981b6')

      h = hostname.get_url_list('otx.alienvault.com')

      assert_equal 'alienvault.com', h.first.domain
      assert_equal 'https://otx.alienvault.com/indicator/hostname/05.microsoftcloudserver.com', h.first.url
      assert_equal 'otx.alienvault.com', h.first.hostname
      assert_equal 'alienvault.com', h.last.domain
      assert_equal 'https://otx.alienvault.com/indicator/url/https:/a248.e.akamai.net/client.akamai.com/install/bin/user_client_win_50276cc/installer_no_upload.exe?name=installer.exe/', h.last.url
      assert_equal 'otx.alienvault.com', h.last.hostname
    end
  end

  def test_get_passive_dns
    VCR.use_cassette('hostname_passive_dns') do
      hostname = OTX::Hostname.new('2f6326698009066c406fc4db742b4c94c888b9b4ed7a4f2075471f25672981b6')

      h = hostname.get_passive_dns('otx.alienvault.com')
    end
  end

  def test_get_http_scans
    VCR.use_cassette('hostname_http_scans') do
      hostname = OTX::Hostname.new('2f6326698009066c406fc4db742b4c94c888b9b4ed7a4f2075471f25672981b6')

      h = hostname.get_http_scans('otx.alienvault.com')

      assert_equal '8c9551d41ef30da2776e92d9cbda6d0306c78762', h.first.value
      assert_equal '443 Certificate Sha1', h.first.name
      assert_equal '443 certificate_sha1', h.first.key
      assert_equal 'HTTP/1.1 200 OK Content Type: text/html  charset=utf 8 Date: Wed  13 Sep 2017 19:32:44 GMT Server: nginx Vary: Accept Encoding X Frame Options: SAMEORIGIN Connection: keep alive ', h.last.value
      assert_equal '443 Header', h.last.name
      assert_equal '443 header', h.last.key
    end
  end

  def test_nids_list
    VCR.use_cassette('hostname_nids_list') do
      hostname = OTX::Hostname.new('test_api')

      h = hostname.nids_list('8.8.8.8')

      # assert_equal 4, i.count
    end
  end
end
