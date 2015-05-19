module HL7
  class Exporter::Patient
    def initialize(pid)
      @pid_patient_name = pid.patient_name.split("^")
      @pid_sex = pid.admin_sex
      @pid_dob = pid.patient_dob
    end

    def name
      "#{patient_data[1]} #{patient_data[0]}"
    end

    def nick_name
      "#{patient_data[4]}"
    end

    def sex
      @pid_sex ? 'Female' : 'Male'
    end

    def dob
      @pid_dob
    end

    def patient_data
      @patient_name_data ||= @pid_patient_name
    end
  end
end
