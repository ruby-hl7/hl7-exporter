require "hl7/exporter/version"

module HL7
  class Exporter
    attr_accessor :message

    def initialize(message)
      @message = message
    end

    def export
      raise "Not implemented"
    end
  end
end
