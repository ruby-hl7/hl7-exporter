require_relative "exporter/version"
require_relative "exporter/csv"
require_relative "exporter/observation"
require_relative "exporter/patient"


module HL7
  class Exporter
    attr_reader :message

    def initialize(message = nil)
      self.message = message
    end

    def message=(msg)
      if hl7? msg
        @message = msg
      else
        @message = HL7::Message.parse msg
      end
    end

    private
    def hl7?(msg)
      msg.respond_to? :to_hl7
    end

    def export
      raise "Not implemented"
    end
  end
end
