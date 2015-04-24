module HL7
  class Exporter::Csv < HL7::Exporter
    def export
      template
    end

    private
    def template
      "Name: #{data[:patient_name]}\nDOB: #{data[:patient_dob]}"
    end

    def getDate(date)
      date = Date.parse date
      date.strftime("%Y/%m/%d")
    end

    def patient_name
      patient_data = message[:PID].patient_name.split("^")
      "#{patient_data[1]} #{patient_data[0]}"
    end

    def data
      { patient_name: patient_name,
        patient_dob:  getDate(message[:PID].patient_dob)
      }
    end
  end
end
