class UserModel {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String image;
  final String phone;
  final String gender;
  final String city;
  final String state;
  final String country;
  final int age;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.image,
    required this.phone,
    required this.gender,
    required this.city,
    required this.state,
    required this.country,
    required this.age,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      firstName: json["firstName"],
      lastName: json["lastName"],
      email: json["email"],
      image: json["image"],
      phone: json["phone"],
      gender: json["gender"],
      city: json["address"]["city"],
      state: json["address"]["state"],
      country: json["address"]["country"],
      age: json["age"],
    );
  }
}