module HL7
  class Exporter::Csv < HL7::Exporter
    def export
      template % data
    end

    private
    def template
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
      date = Date.parse date
      date.strftime("%Y/%m/%d")
    end

    def patient_name
      "#{patient_data[1]} #{patient_data[0]}"
    end

    def nick_name
      "#{patient_data[4]}"
    end

    def sex
      message[:PID].admin_sex ? 'Female' : 'Male'
    end

    def patient_data
      @patient_name_data ||= message[:PID].patient_name.split("^")
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

    def data
      {
        sending_facility: sending_facility,
        patient_name: patient_name,
        patient_dob:  getDate(message[:PID].patient_dob),
        nick_name:  nick_name,
        sex: sex,
        test_results: test_results,
      }
    end
  end
end
