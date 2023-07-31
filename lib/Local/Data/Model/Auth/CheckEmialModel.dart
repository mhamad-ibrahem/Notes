class CheckEmialModel {
  String email;
 
  CheckEmialModel({
    required this.email,
  });
  factory CheckEmialModel.fromJson(Map<String, dynamic> json) => CheckEmialModel(
        email: json["email"],
      );
  Map<String, dynamic> toJson() => {
        "email": email,
      };
}
