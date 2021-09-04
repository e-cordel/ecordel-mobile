import 'dart:convert';

import './author.dart';

class Ecordel {
  int id;
  Author author;
  String title;
  String? description;
  String? content;
  String? xilogravuraUrl;
  List<String>? tags;

  Ecordel({
    required this.id,
    required this.author,
    required this.title,
    this.description,
    this.content,
    this.xilogravuraUrl,
    this.tags,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'author': author.toMap(),
      'title': title,
      'description': description,
      'content': content,
      'xilogravuraUrl': xilogravuraUrl,
      'tags': tags,
    };
  }

  factory Ecordel.fromMap(Map<String, dynamic> map) {
    return Ecordel(
      id: map['id'],
      author: Author.fromMap(map['author']),
      title: map['title'],
      description: map['description'],
      content: map['content'],
      xilogravuraUrl: map['xilogravuraUrl'],
      tags: List<String>.from(map['tags']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Ecordel.fromJson(String source) =>
      Ecordel.fromMap(json.decode(source));
}
