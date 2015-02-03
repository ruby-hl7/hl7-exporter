require "hl7/exporter/version"

module HL7
  class Exporter
    attr_accessor :message

    def initialize(message)
      @message = message
    end

    def csv
      template
    end

    private
    def template
      "Name: #{data[:patient_name]}\nBID: #{data[:patient_dob]}"
    end

    def data
      { patient_name: message[:PID].patient_name,
        patient_dob: message[:PID].patient_dob
      }
    end
  end
end
