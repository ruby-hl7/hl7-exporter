module HL7
  class Exporter::Csv < HL7::Exporter
    def export
      template
    end

    private
    def template
      "Sending Facility: #{data[:sending_facility]}\n" +
      "Name: #{data[:patient_name]}\n" +
      "DOB: #{data[:patient_dob]}\n" +
      "Nick: #{nick_name}\n"+
      "Sex: #{sex}\n"
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
      message[:MSH].sending_facility || ''
    end

    def data
      {
        sending_facility: sending_facility,
        patient_name: patient_name,
        patient_dob:  getDate(message[:PID].patient_dob),
        nick_name:  nick_name,
      }
    end
  end
end
