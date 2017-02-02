module OTX
  #
  # AlienVault OTX Pulse Record
  #
  # @author Stephen Kapp
  # @attr [String] id OTX ID value for the pulse Record
  # @attr [String] name Pulse Name
  # @attr [String] description Description of the pulse
  # @attr [String] author_name Name of the pulse author_name
  # @attr [Array<String>] tags Array of 'tags' to describe the pulse
  # @attr [Array<String>] referenes Array of references attached to the pulse
  # @attr [String] revision Revision number of the OTX Pulse Record
  # @attr [Array<OTX::Indicators>] indicators Array of the IoC attached to the OTX pulse
  # @attr [String] tlp Traffic light protocol color as appropriate to U.S. DHS
  # @attr [Boolean] public Privacy setting
  # @attr [Boolean] in_group
  # @attr [String] group_id
  # @attr [String] group_name
  # @attr [Array<String>] groups
  # @attr [String] adversary
  # @attr [Array<String>] targeted_countries
  # @attr [Array<String>] industries
  #
  class Pulse < OTX::Type::Base
    attr_accessor :name, :description, :author_name,
      :tags, :references, :revision, :indicators, :tlp, :public, :in_group,
      :group_id, :group_name, :groups, :adversary, :targeted_countries,
      :industries

    def initialize(attributes={})
      attributes.each do |key, value|
        # Dynamically Add any missing attributes
        unless self.respond_to?(key)
          self.class.send(:attr_accessor, key)
        end

        if key == 'indicators'
          @indicators = []
          value.each do |indicator|
            @indicators << OTX::Indicators.new(indicator)
          end
        elsif key == 'observation'
          @observation = OTX::Indicator::Pulse::Observation.new(value)
        elsif key == 'indicator_type_counts'
          @indicator_type_counts = OTX::Indicator::Pulse::IndicatorTypeCounts.new(value)
        elsif key == 'author'
          @author = OTX::Indicator::Pulse::Author.new(value)
        else
          send("#{key.downcase}=", value)
        end
      end
    end
  end
end
