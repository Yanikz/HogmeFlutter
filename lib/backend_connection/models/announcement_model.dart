class AnnouncementModel {
  //initialized the user data models into null safety values
  int? id;
  String? title;
  String? content;
  DateTime? createdAt;

  //assigned the values
  AnnouncementModel({
    this.id,
    this.title,
    this.content,
    this.createdAt,
  });

  //convert the data format into json format
  factory AnnouncementModel.fromJson(Map<String, dynamic> json) {
    return AnnouncementModel(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      createdAt: DateTime.parse(json["created_at"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "content": content,
        "createdAt": createdAt!.toIso8601String(),
      };
}
