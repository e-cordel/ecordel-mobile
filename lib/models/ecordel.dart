import 'dart:convert';

import './author.dart';

class Cordel {
  int id;
  Author author;
  String title;
  String? description;
  String? content;
  String? xilogravuraUrl;
  List<String>? tags;

  Cordel({
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

  factory Cordel.fromMap(Map<String, dynamic> map) {
    return Cordel(
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

  factory Cordel.fromJson(String source) => Cordel.fromMap(json.decode(source));
}
