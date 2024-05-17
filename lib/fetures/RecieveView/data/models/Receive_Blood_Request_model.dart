class ReceiveBloodModel{
  final String? name;
  final String? uId;
   final String? patientName;
   final String? patientAge;
   final String patientLocation;
   final String whyDoNeedBlood;
   final String namesMedicines;
   final String? bagsNumber;
   final String relationYorWithPatient;
   final String bloodType;
  final String dataTime;

  ReceiveBloodModel({
    required this.dataTime,
    required this.patientName,
    required this.patientAge,
    required this.patientLocation,
    required this.whyDoNeedBlood,
    required this.namesMedicines,
    required this.bagsNumber,
    required this.relationYorWithPatient,
    required this.bloodType,
    required this.name,
    required this.uId,

  });
   factory ReceiveBloodModel.fromJson(Map<String, dynamic> json) {
     return ReceiveBloodModel(
       bagsNumber: json['bagsNumber'],
       namesMedicines: json['namesMedicines'],
       patientAge: json['patientAge'],
       patientLocation: json['patientLocation'],
       patientName: json['patientName'],
       relationYorWithPatient: json['relationYorWithPatient'],
       whyDoNeedBlood: json['whyDoNeedBlood'],
       bloodType: json['bloodType'],
       uId: json['uId'],
       name: json['name'],
       dataTime: json['dataTime'],
     );
   }
   Map<String, dynamic> toMap() {
     return {
       'bagsNumber': bagsNumber,
       'namesMedicines': namesMedicines,
       'patientAge': patientAge,
       'patientLocation': patientLocation,
       'patientName': patientName,
       'relationYorWithPatient': relationYorWithPatient,
       'whyDoNeedBlood':whyDoNeedBlood,
       'name':name,
       'uId':uId,
       'dataTime':dataTime,
       'bloodType':bloodType
     };
   }

}