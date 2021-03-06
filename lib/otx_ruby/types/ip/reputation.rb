module OTX
  module Indicator
    module IP
      class Reputation < OTX::Type::Base
        #
        # Needs details for attributes
        #
        attr_accessor :as, :threat_score, :first_seen, :city, :allow_ping, :reputation_rel_checked, :counts,
        :lon, :status, :last_seen, :state, :activities, :server_type, :matched_bl, :address, :lat, :date_added,
        :country, :up, :reputation_rel, :matched_wl, :domains, :reputation_val_checked, :reputation_val, :id, :organization

        def _id=(id)
          @id = id['$id']
        end

        def initialize(attributes={})
          attributes.each do |key, value|
            _key = key.gsub('-', '_')

            unless self.respond_to?(_key.downcase)
              self.class.send(:attr_accessor, _key.downcase)
            end

            if _key != 'activities'
              send("#{_key.downcase}=", value)
            else
              @activities = []
              value.each do |activity|
                @activities << OTX::Indicator::Activity.new(activity)
              end
            end
          end
        end
      end
    end
  end
end
