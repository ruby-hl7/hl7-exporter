require 'hl7-exporter'
message = %[MSH|^~\&|SOURCE|TEST_LAB_INC|HEALTH|382715520|2014100914484648||ORU^R01|0129938170710091448|P|2.3|
\rPID|1||333||LastName^FirstName^MiddleInitial^SR^NickName||19760228|F||2106-3^White^HL70005^CAUC^Caucasian^L||||||
\rORC|RE|35748030580^LAB|35748030580^LAB||||||201312240000|||FEDA^^^^^^^L
\rOBR|1|35748030580^LAB|35748030580^LAB|221010^Lipid Panel w/ Chol/HDL Ratio^L|||201312230656|||||||201312240329||||||35748030580||201312241108|||F
\rOBX|1|NM|001065^Cholesterol, Total^L^2093-3^Cholesterol^LN||232|mg/dL|100-199|H||N|F|20120910||201312241053|01
\rOBX|2|NM|001172^Triglycerides^L^2571-8^Triglyceride^LN||179|mg/dL|0-149|H||N|F|20120910||201312241053|01
\rOBX|3|NM|011817^HDL Cholesterol^L^2085-9^Cholesterol.in HDL^LN||40|mg/dL|>39|||N|F|20020107||201312241053|01
]

hl7_message = HL7::Message.parse(message)
exporter = HL7::Exporter::Csv.new(hl7_message)
exporter.export
