require 'spec_helper'
describe HL7::Exporter::Csv do
  let(:hl7_msh){
    'MSH|^~\&|SOURCE|383018129|HEALTH|382715520|2014100914484648||ORU^R01|0129938170710091448|P|2.3|'
  }
  let(:hl7_pid) {
      'PID|1||333||LastName^FirstName^MiddleInitial^SR^NickName||19760228|F||2106-3^White^HL70005^CAUC^Caucasian^L||||||' }
  let(:message) { HL7::Message.parse(hl7_msh + "\n" + hl7_pid) }
  let(:exporter) { HL7::Exporter::Csv.new(message) }
  subject(:csv) { exporter.export.split("\n") }

  it { expect(csv[0]).to eq "Sending Facility: HEALTH" }
  it { expect(csv[1]).to eq "Name: FirstName LastName" }
  it { expect(csv[2]).to eq "DOB: 1976/02/28"  }
  it { expect(csv[3]).to eq "Nick: NickName"  }
  it { expect(csv[4]).to eq "Sex: Female"  }
end
