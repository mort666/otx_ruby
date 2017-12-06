require 'test_helper'

class PulsesTest < Minitest::Test
  def test_get_pulse
    VCR.use_cassette('pulse_get') do
      pulse = OTX::Pulses.new('test_api')

      p = pulse.get_pulse('57204e9b3c4c3e015d93cb12')

      assert p.industries.empty?
      assert_equal 'green', p.tlp
      assert p.tags.include? 'rat'
      assert_equal 'AlienVault', p.author_name
      assert_equal 1, p.public
      assert p.references.include? 'https://www.arbornetworks.com/blog/asert/recent-poison-iv/'
      assert p.targeted_countries.empty?
    end
  end
  
  def test_search
    VCR.use_cassette('pulse_search') do
      pulse = OTX::Pulses.new('test_api')

      p = pulse.search('AlienVault')

      assert_equal 'mbeavers+151007@alienvault.com', p.first.username
      assert_equal 0, p.first.pulse_count
      assert_equal 4891, p.first.user_id
      assert_equal 1, p.first.subscriber_count
      assert_equal '770 days ago ', p.first.member_since
      assert_equal 0, p.first.award_count
      assert_equal 'https://otx.alienvault.com/static/img/default.png', p.first.avatar_url
      assert p.first.awards.empty?
      assert_equal 0, p.first.follower_count
      assert_equal 0, p.first.accepted_edits_count

      assert_equal 'rwood@alienvault.com', p.last.username
      assert_equal 0, p.last.pulse_count
      assert_equal 44148, p.last.user_id
      assert_equal 1, p.last.subscriber_count
      assert_equal '23 days ago ', p.last.member_since
      assert_equal 0, p.last.award_count
      assert_equal 'https://otx.alienvault.com/static/img/default.png', p.last.avatar_url
      assert p.last.awards.empty?
      assert_equal 0, p.last.follower_count
      assert_equal 0, p.last.accepted_edits_count
    end
  end

  def test_get_user_pulses
    VCR.use_cassette('pulse_user_pulses') do
      pulse = OTX::Pulses.new('test_api')

      p = pulse.get_user_pulses('AlienVault')

      assert_equal 'web', p.first.pulse_source
      assert_equal 'white', p.first.tlp
      assert_equal 43452, p.first.subscriber_count
      assert p.first.tags.include? 'MuddyWater'
      assert_equal 23, p.first.export_count
      assert_equal 0, p.first.is_following
      assert_equal false, p.first.is_modified
      assert_equal 0, p.first.upvotes_count
      assert_equal 0, p.first.is_subscribing
      assert p.first.targeted_countries.include? 'Saudi Arabia'
      assert p.first.groups.empty?
      assert_equal 0, p.first.vote
      assert_equal 0, p.first.validator_count
      assert_equal false, p.first.is_author
      assert_equal '5a0b695faa066457f990a598', p.first.id
      assert_equal 0, p.first.locked
      assert_equal 'Muddying the Water: Targeted Attacks in the Middle East', p.first.name
      assert_equal 0, p.first.downvotes_count
      assert_equal 0, p.first.comment_count
      assert_equal 108, p.first.indicator_count
      assert_equal false, p.first.in_group
      assert_equal 0, p.first.follower_count
      assert_equal 0, p.first.votes_count
      assert_equal 1, p.first.public

      assert_equal 'web', p.last.pulse_source
      assert_equal 'white', p.last.tlp
      assert_equal 43476, p.last.subscriber_count
      assert p.last.tags.include? 'seduploader'
      assert_equal 29, p.last.export_count
      assert_equal 0, p.last.is_following
      assert_equal false, p.last.is_modified
      assert_equal 0, p.last.upvotes_count
      assert_equal 0, p.last.is_subscribing
      assert p.last.targeted_countries.empty?
      assert p.last.groups.empty?
      assert_equal 0, p.last.vote
      assert_equal 0, p.last.validator_count
      assert_equal false, p.last.is_author
      assert_equal '5a020ee3ced01a160c3350b7', p.last.id
      assert_equal 0, p.last.locked
      assert_equal 'Threat Group APT28 Slips Office Malware into Doc Citing NYC Terror Attack', p.last.name
      assert_equal 0, p.last.downvotes_count
      assert_equal 0, p.last.comment_count
      assert_equal 11, p.last.indicator_count
      assert_equal false, p.last.in_group
      assert_equal 0, p.last.follower_count
      assert_equal 0, p.last.votes_count
      assert_equal 1, p.last.public
    end
  end

  def test_get_related
    VCR.use_cassette('pulse_related') do
      pulse = OTX::Pulses.new('test_api')

      p = pulse.get_related('57204e9b3c4c3e015d93cb12')

      assert_equal 'green', p.first.tlp
      assert_equal 'infosec@firstfinancial.org', p.first.author_name
      assert_equal 1, p.first.public
      assert p.first.targeted_countries.empty?

      assert_equal 'green', p.last.tlp
      assert_equal 'zer0daydan', p.last.author_name
      assert_equal 1, p.last.public
      assert p.last.targeted_countries.empty?
    end
  end

  def test_get_indicators
    VCR.use_cassette('pulse_indicators') do
      pulse = OTX::Pulses.new('test_api')

      p = pulse.get_indicators('57204e9b3c4c3e015d93cb12')

      assert_equal 'webserver.servehttp.com', p.first.indicator
      assert_equal '', p.first.description
      assert_equal '', p.first.title
      assert_equal 'hostname', p.first.slug
      assert_equal '', p.first.content
      assert_equal '57204e9b3c4c3e015d93cb12', p.first.pulse_key
      assert_equal 'hostname', p.first.type
      assert_equal 361850, p.first.id

      assert_equal 'ec646c57f9ac5e56230a17aeca6523a4532ff472', p.last.indicator
      assert_equal '', p.last.description
      assert_equal '', p.last.title
      assert_equal 'file', p.last.slug
      assert_equal '', p.last.content
      assert_equal '57204e9b3c4c3e015d93cb12', p.last.pulse_key
      assert_equal 'FileHash-SHA1', p.last.type
      assert_equal 361857, p.last.id
    end
  end

  def test_get_indicator_types
    VCR.use_cassette('pulse_indicator_types') do
      pulse = OTX::Pulses.new('test_api')

      p = pulse.get_indicator_types

      assert_equal 'ip', p.first.slug
      assert_equal 'IPv4', p.first.name
      assert_equal 'An IPv4 address indicating the online location of a server or other computer.', p.first.description

      assert_equal 'yara', p.last.slug
      assert_equal 'YARA', p.last.name
      assert_equal 'YARA Rule', p.last.description
    end
  end
end
