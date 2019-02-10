##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
# 
# frozen_string_literal: true

module Twilio
  module REST
    class Trunking
      class V1 < Version
        ##
        # Initialize the V1 version of Trunking
        def initialize(domain)
          super
          @version = 'v1'
          @trunks = nil
        end

        ##
        # @param [String] sid A 34 character string that uniquely identifies the SIP Trunk
        #   in Twilio.
        # @return [Twilio::REST::Trunking::V1::TrunkContext] if sid was passed.
        # @return [Twilio::REST::Trunking::V1::TrunkList]
        def trunks(sid=:unset)
          if sid.nil?
            raise ArgumentError, 'sid cannot be nil'
          elsif sid == :unset
            @trunks ||= TrunkList.new self
          else
            TrunkContext.new(self, sid)
          end
        end

        ##
        # Provide a user friendly representation
        def to_s
          '<Twilio::REST::Trunking::V1>'
        end
      end
    end
  end
end