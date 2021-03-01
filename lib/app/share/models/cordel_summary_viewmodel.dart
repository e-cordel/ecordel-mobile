import 'dart:convert';

class CordelSummaryViewModel {
  final int id;
  final String title;
  final String xilogravuraUrl;
  final String authorName;
  CordelSummaryViewModel({
    this.id,
    this.title,
    this.xilogravuraUrl,
    this.authorName,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'xilogravuraUrl': xilogravuraUrl,
      'authorName': authorName,
    };
  }

  factory CordelSummaryViewModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return CordelSummaryViewModel(
      id: map['id'],
      title: map['title'],
      xilogravuraUrl: map['xilogravuraUrl'],
      authorName: map['authorName'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CordelSummaryViewModel.fromJson(String source) =>
      CordelSummaryViewModel.fromMap(json.decode(source));
}
