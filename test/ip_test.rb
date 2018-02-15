require 'test_helper'

class IPTest < Minitest::Test
  def test_get_general
    VCR.use_cassette('ip_general') do
      ip = OTX::IP.new('test_api')

      i = ip.get_general('8.8.8.8')

      assert_equal '8.8.8.8', i.indicator
      assert_equal 'IPv4', i.type_title
      assert_equal 'IPv4', i.type
      assert_equal 14, i.pulse_info.count
      assert_equal '/static/img/flags/us.png', i.flag_url
      assert_equal 0, i.area_code
      assert_equal 'NA', i.continent_code
      assert_equal 'USA', i.country_code3
      assert_equal 'US', i.country_code
      assert_equal 'United States', i.country_name
      assert_equal 'United States', i.flag_title
      assert_equal 'AS15169 Google Inc.', i.asn
      assert_equal 0, i.dma_code
    end
  end

  def test_get_reputation
    VCR.use_cassette('ip_reputation') do
      ip = OTX::IP.new('test_api')

      i = ip.get_reputation('94.23.1.215')

      assert_equal 'OVH SAS', i.organization
    end
  end

  def test_get_geo
    VCR.use_cassette('ip_geo') do
      ip = OTX::IP.new('test_api')

      i = ip.get_geo('8.8.8.8')

      assert_equal '/static/img/flags/us.png', i.flag_url
      assert_equal 0, i.area_code
      assert_equal 'NA', i.continent_code
      assert_equal 'USA', i.country_code3
      assert_equal 'US', i.country_code
      assert_equal 'United States', i.country_name
      assert_equal 'United States', i.flag_title
      assert_equal 'AS15169 Google Inc.', i.asn
      assert_equal 0, i.dma_code
    end
  end

  def test_get_malware
    VCR.use_cassette('ip_malware') do
      ip = OTX::IP.new('test_api')

      i = ip.get_malware('8.8.8.8')

      refute i.empty?
      assert_equal 1508608947, i.first.datetime_int
      assert_equal '59eb8b29ba34670018f17146', i.first._id
      assert_equal 1508608368, i.last.datetime_int
      assert_equal '59eb896db1d166001895b861', i.last._id
    end
  end

  def test_get_url_list
    VCR.use_cassette('ip_url_list') do
      ip = OTX::IP.new('test_api')

      i = ip.get_url_list('8.8.8.8')

      assert_equal 'hashminer.store', i.first.domain
      assert_equal 'https://hashminer.store', i.first.url
      assert_equal 'hashminer.store', i.first.hostname
      assert_equal 'securebiz.us', i.last.domain
      assert_equal 'http://fbi.gov.id9654125.securebiz.us/', i.last.url
      assert_equal 'fbi.gov.id9654125.securebiz.us', i.last.hostname
    end
  end

  def test_get_passive_dns
    VCR.use_cassette('ip_passive_dns') do
      ip = OTX::IP.new('test_api')

      i = ip.get_passive_dns('8.8.8.8')

      assert_equal '/indicator/domain/jie1383.com', i.first.indicator_link
      assert_equal 'jie1383.com', i.first.hostname
      assert_equal '8.8.8.8', i.first.address
      assert_equal '/static/img/flags/us.png', i.first.flag_url
      assert_equal 'United States', i.first.flag_title
      assert_equal 'domain', i.first.asset_type
      assert_equal '/indicator/domain/experiencescomcast.net', i.last.indicator_link
      assert_equal 'experiencescomcast.net', i.last.hostname
      assert_equal '8.8.8.8', i.last.address
      assert_equal '/static/img/flags/us.png', i.last.flag_url
      assert_equal 'United States', i.last.flag_title
      assert_equal 'domain', i.last.asset_type
    end
  end

  def test_get_http_scans
    VCR.use_cassette('ip_http_scans') do
      ip = OTX::IP.new('test_api')

      i = ip.get_http_scans('8.8.8.8')

      assert_equal 'www.google.com', i.first.value
      assert_equal '443 A Domains', i.first.name
      assert_equal '443 a_domains', i.first.key
      assert_equal '301 Moved', i[2].value
      assert_equal ' 443 Title', i[2].name
      assert_equal '443 title', i[2].key
    end
  end

  def test_nids_list
    VCR.use_cassette('ip_nids_list') do
      ip = OTX::IP.new('test_api')

      i = ip.count_nids_list('8.8.8.8')

      assert_equal 91, i.count
      assert_equal '2014374', i.results[0]
    end
  end
end
