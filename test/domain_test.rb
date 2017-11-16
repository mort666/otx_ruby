require 'test_helper'

class DomainTest < Minitest::Test
  def test_get_general
    VCR.use_cassette('domain_general') do
      domain = OTX::Domain.new('test_api')

      domain_general = domain.get_general('spywaresite.info')
    end
  end

  def test_get_geo
    VCR.use_cassette('domain_geo') do
      domain = OTX::Domain.new('test_api')

      domain_geo = domain.get_geo('spywaresite.info')
    end
  end

  def test_get_malware
    VCR.use_cassette('domain_malware') do
      domain = OTX::Domain.new('test_api')

      domain_malware = domain.get_malware('spywaresite.info')
    end
  end

  def test_get_url_list
    VCR.use_cassette('domain_url_list') do
      domain = OTX::Domain.new('test_api')

      domain_url_list = domain.get_url_list('spywaresite.info')
    end
  end

  def test_get_passive_dns
    VCR.use_cassette('domain_passive_dns') do
      domain = OTX::Domain.new('test_api')

      domain_passive_dns = domain.get_passive_dns('spywaresite.info')
    end
  end

  def test_whois
    VCR.use_cassette('domain_whois') do
      domain = OTX::Domain.new('test_api')

      domain_whois = domain.whois('spywaresite.info')
    end
  end
end
