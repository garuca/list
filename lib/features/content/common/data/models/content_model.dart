import 'package:list/features/content/common/domain/entities/content.dart';

class ContentModel implements Content {
  @override
  String? id;
  @override
  String? text;

  ContentModel({
    this.id,
    this.text,
  });

  ContentModel.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];
  }
}
