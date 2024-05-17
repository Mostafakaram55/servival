class DonationModel{
  final String? name;
  final String? uId;
  final String? bloodType;
  final String? location;
  final String? haveYouDonationBefore;
  final String? dataLastTimeDonation;
  final String? numberTimesDonation;
  final String? doYouHaveAnyDisease;
  final String? mentionTheDisease;
   final String? dataTime;

  DonationModel({
    required this.location,
    required this.haveYouDonationBefore,
    required this.dataLastTimeDonation,
    required this.numberTimesDonation,
    required this.doYouHaveAnyDisease,
    required this.mentionTheDisease,
    required this.uId,
    required this.name,
    required this.bloodType,
    required this.dataTime,
  });
  factory DonationModel.fromJson(Map<String, dynamic> json) {
    return DonationModel(
      location: json['location'],
      haveYouDonationBefore: json['haveYouDonationBefore'],
      dataLastTimeDonation: json['dataLastTimeDonation'],
      numberTimesDonation: json['numberTimesDonation'],
      doYouHaveAnyDisease: json['doYouHaveAnyDisease'],
      mentionTheDisease: json['mentionTheDisease'],
      bloodType:json['bloodType'] ,
        dataTime:json['dataTime'] ,
      name: json['name'], uId: json['uId']
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'location': location,
      'haveYouDonationBefore': haveYouDonationBefore,
      'dataLastTimeDonation': dataLastTimeDonation,
      'numberTimesDonation': numberTimesDonation,
      'doYouHaveAnyDisease': doYouHaveAnyDisease,
      'mentionTheDisease': mentionTheDisease,
      'uId':uId,
      'dataTime':dataTime,
      'name':name,
      'bloodType':bloodType
      //'image':image,
    };
  }
}