module HL7
  class Exporter::Observation
    attr_accessor :obr

    def initialize(obr)
      @obr = obr
    end

    def name
      obr.observation_id.split('^')[1].sub(",","")
    end

    def result
      obr.observation_value
    end

    def units
      obr.units
    end

    def flags
      obr.abnormal_flags
    end

    def reference_range
      obr.references_range
    end
  end
end
