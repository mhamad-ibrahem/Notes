class NotesModel {
  final String userId;
  final String title;
  final String subTitle;
  final String image;
  final String date;
  NotesModel({
    required this.userId,
    required this.title,
    required this.subTitle,
    required this.image,
    required this.date,
  });
  factory NotesModel.fromJson(Map<String, dynamic> jsonData) => NotesModel(
        userId: jsonData['user id'],
        title: jsonData['title'],
        subTitle: jsonData['sub_title'],
        image: jsonData['image'],
        date: jsonData['date'],
      );
}
