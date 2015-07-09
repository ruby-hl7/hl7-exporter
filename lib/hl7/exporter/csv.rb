module HL7
  class Exporter::Csv < HL7::Exporter
    attr_accessor :template

    def export
      template % data
    end

    def template
      @template ||= default_template
    end

    private
    def default_template
%[Sending Facility: %{sending_facility}
Name: %{patient_name}
DOB: %{patient_dob}
Nick: %{nick_name}
Sex: %{sex}
test, result, flag, units, reference interval
%{test_results}
]
    end

    def obr_row_template(observation)
      "#{observation.name}, #{observation.result}, #{observation.flags}, " +
      "#{observation.units}, #{observation.reference_range}"
    end

    def getDate(date)
      Date.parse(date).strftime("%Y/%m/%d")
    end

    def sending_facility
      return '' unless message[:MSH]
      message[:MSH].sending_facility || ''
    end

    def test_results
      message[:OBR].children.map{ |obr|
        observation_row(obr)
      }.join("\n")
    end

    def observation_row(obr)
      observation = HL7::Exporter::Observation.new(obr)
      obr_row_template(observation)
    end

    def patient
      @patient ||= HL7::Exporter::Patient.new(message[:PID])
    end

    def data
      {
        sending_facility: sending_facility,
        patient_name: patient.name,
        patient_dob:  getDate(patient.dob),
        nick_name:  patient.nick_name,
        sex: patient.sex,
        test_results: test_results,
      }
    end
  end
end
