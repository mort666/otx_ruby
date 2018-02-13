require 'test_helper'

class DomainTest < Minitest::Test
  def test_get_general
    VCR.use_cassette('domain_general') do
      domain = OTX::Domain.new('test_api')

      d = domain.get_general('spywaresite.info')

      assert_equal 'spywaresite.info', d.indicator
      assert_equal 'domain', d.type
      assert_equal 2, d.pulse_info.count
      assert_equal 2102119, d.base_indicator.id
    end
  end

  def test_get_geo
    VCR.use_cassette('domain_geo') do
      domain = OTX::Domain.new('test_api')

      d = domain.get_geo('spywaresite.info')

      assert_equal '/static/img/flags/us.png', d.flag_url
      assert_equal 'Sunnyvale', d.city
      assert_equal 'CA', d.region
      assert_equal 408, d.area_code
      assert_equal 'USA', d.country_code3
      assert_equal 'US', d.country_code
      assert_equal 'United States', d.country_name
      assert_equal 'United States', d.flag_title
    end
  end

  def test_get_malware
    VCR.use_cassette('domain_malware') do
      domain = OTX::Domain.new('test_api')

      d = domain.get_malware('spywaresite.info')

      assert d.empty?
    end
  end

  def test_get_url_list
    VCR.use_cassette('domain_url_list') do
      domain = OTX::Domain.new('test_api')

      d = domain.get_url_list('spywaresite.info')

      assert_equal 'spywaresite.info', d.first.domain
      assert_equal 'http://spywaresite.info', d.first.url
      assert_equal 'spywaresite.info', d.first.hostname
      assert_equal 'spywaresite.info', d.last.domain
      assert_equal 'http://spywaresite.info/', d.last.url
      assert_equal 'spywaresite.info', d.last.hostname
    end
  end

  def test_get_passive_dns
    VCR.use_cassette('domain_passive_dns') do
      domain = OTX::Domain.new('test_api')

      d = domain.get_passive_dns('spywaresite.info')

      assert_equal 'spywaresite.info', d.first.hostname
      assert_equal '69.165.98.21', d.first.address
      assert_equal '/static/img/flags/us.png', d.first.flag_url
      assert_equal 'United States', d.first.flag_title
      assert_equal 'domain', d.first.asset_type
    end
  end

  def test_whois
    VCR.use_cassette('domain_whois') do
      domain = OTX::Domain.new('test_api')

      d = domain.whois('spywaresite.info')

      assert_equal 18, d.count
    end
  end

  def test_nids_list
    VCR.use_cassette('domain_nids_list') do
      domain = OTX::Domain.new('993b4ca8940f3298987a511d5c6795760febbed7bde76f38012bd128b03ca1a0', 'test_api')

      d = domain.nids_list('spywaresite.info')

      # assert_equal 4, d.count
    end
  end
end
