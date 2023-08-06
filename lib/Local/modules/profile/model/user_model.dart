class UserModel {
  final String name;
  final String email;
  final String password;
  final String number;
  final String? image;

  UserModel({
    required this.name,
    required this.email,
    required this.password,
    required this.number,
    required this.image,
  });
  factory UserModel.fromJson(Map<String, dynamic> jsonData) => UserModel(
        name: jsonData['name'],
        email: jsonData['email'],
        password: jsonData['password'],
        number: jsonData['number'],
        image: jsonData['image'],
      );
}
