class NotesModel {
  final String userId;
  final String title;
  final String subTitle;
  final String image;
  final String date;
  final String? notesId;
  bool isDeleteLoading;
  NotesModel({
    required this.notesId,
    required this.userId,
    required this.title,
    required this.subTitle,
    required this.image,
    required this.date,
    this.isDeleteLoading = false,
  });
  factory NotesModel.fromJson(Map<String, dynamic> jsonData, String id) =>
      NotesModel(
        notesId: id,
        userId: jsonData['user id'],
        title: jsonData['title'],
        subTitle: jsonData['sub_title'],
        image: jsonData['image'],
        date: jsonData['date'],
      );
}
