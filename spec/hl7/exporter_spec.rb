require 'spec_helper'
describe HL7::Exporter::Csv do
  let(:hl7_msh){
    'MSH|^~\&|SOURCE|TEST_LAB_INC|HEALTH|382715520|2014100914484648||ORU^R01|0129938170710091448|P|2.3|'
  }
  let(:hl7_pid) {
      'PID|1||333||LastName^FirstName^MiddleInitial^SR^NickName||19760228|F||2106-3^White^HL70005^CAUC^Caucasian^L||||||'
    }
  let(:message) { hl7_msh + "\r" + hl7_pid }
  let(:hl7_meessage) { HL7::Message.parse(message) }
  let(:exporter) { HL7::Exporter::Csv.new(hl7_meessage) }
  subject(:csv) { exporter.export.split("\n") }

  it { expect(csv[0]).to eq "Sending Facility: TEST_LAB_INC" }
  it { expect(csv[1]).to eq "Name: FirstName LastName" }
  it { expect(csv[2]).to eq "DOB: 1976/02/28"  }
  it { expect(csv[3]).to eq "Nick: NickName"  }
  it { expect(csv[4]).to eq "Sex: Female"  }
end
