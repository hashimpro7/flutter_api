class PostsModel {
  final num userId;
  final num id;
  final String title;
  final String body;

  PostsModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory PostsModel.fromJson(Map<String, dynamic> json) {
    return PostsModel(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }

  PostsModel copyWith({
    num? userId,
    num? id,
    String? title,
    String? body,
  }) {
    return PostsModel(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }
}
