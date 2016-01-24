module OTX
  class Event < OTX::Type::Base
    #
    # Account Events Object Type
    #
    # @attr [String] id ID value for record
    # @attr [String] action Action peformed, currently supports (subscribe, unsubscribe, delete)
    # @attr [String] object_type Currently supports events for pulse and user objects
    # @attr [String] object_id ID value for the object the event is created for
    #
    attr_accessor :id, :action, :object_type, :object_id
  end
end
