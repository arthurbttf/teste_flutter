// ignore_for_file: public_member_api_docs, sort_constructors_first
class PostModel {
  final int userId;
  final int id;
  final String title;
  final String body;

  PostModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }

  factory PostModel.fromJson(Map<String, dynamic> map) {
    return PostModel(
      userId: map['userId']?.toInt(),
      id: map['id']?.toInt(),
      title: map['title'],
      body: map['body'],
    );
  }
}
