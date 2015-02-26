require 'spec_helper'
describe HL7::Exporter::Csv do
  let(:hl7_pid) {
      'PID|1||333||LastName^FirstName^MiddleInitial^SR^NickName||19760228|F||2106-3^White^HL70005^CAUC^Caucasian^L||||||' }
  let(:message) { HL7::Message.parse(hl7_pid) }
  let(:exporter) { HL7::Exporter::Csv.new(message) }
  subject(:csv) { exporter.export }

  it { expect(csv).not_to be_nil }
  it { expect(csv).to eq "Name: FirstName LastName\nBID: 1976/02/28" }
end
