class UserModel {
  final String name;
  final String email;
  final String phone;
  final String uId;
  final String location;
  final String bloodType;
  //final String image;
  final num age;



  const UserModel({
    required this.email,
    required this.phone,
    required this.name,
    required this.uId,
    required this.location,
    required this.bloodType,
    required this.age,
  //  required this.image

  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      phone: json['phone'],
      name: json['fullName'],
      uId: json['uId'],
      location: json['location'],
      bloodType: json['bloodType'],
      age: json['age'],
   //   image: json['image'],
    );
    //image = json['image'];
  }

  Map<String, dynamic> toMap() {
    return {
      'fullName': name,
      'email': email,
      'phone': phone,
      'uId': uId,
      'location': location,
      'bloodType': bloodType,
      'age': age,
     // 'image':image,
    };
  }
}
