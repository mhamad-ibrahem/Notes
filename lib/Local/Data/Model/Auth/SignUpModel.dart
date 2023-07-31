class SignUpModel {
  String email;
  String password;
  SignUpModel({
    required this.password,
    required this.email,
  });
  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
        email: json["email"],
        password: json["password"],
      );
  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}
