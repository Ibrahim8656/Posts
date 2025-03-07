import 'package:flutter_application_1/features/posts/domain/entities/posts.dart';

class PostModel extends Post {
  PostModel(super.id, super.title, super.body);

  factory PostModel.fromjson(Map<String, dynamic> json) {
    return PostModel(json["id"], json["title"], json["body"]);
  }
  Map<String, dynamic> tojson() {
    return {"id": id, "title": title, "body": body};
  }
}
