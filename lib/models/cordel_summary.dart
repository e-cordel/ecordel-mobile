import 'dart:convert';

class CordelSummary {
  final int id;
  final String title;
  final String xilogravuraUrl;
  final String authorName;

  CordelSummary(
      {required this.id,
      required this.title,
      required this.authorName,
      this.xilogravuraUrl = ''});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'xilogravuraUrl': xilogravuraUrl,
      'authorName': authorName,
    };
  }

  factory CordelSummary.fromMap(Map<String, dynamic> map) {
    return CordelSummary(
      id: map['id'],
      title: map['title'],
      xilogravuraUrl: map['xilogravuraUrl'],
      authorName: map['authorName'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CordelSummary.fromJson(String source) =>
      CordelSummary.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CordelSummaryViewModel(id: $id, title: $title, xilogravuraUrl: $xilogravuraUrl, authorName: $authorName)';
  }
}
