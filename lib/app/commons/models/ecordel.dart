import 'dart:convert';

import './author.dart';
import 'xilogravura.dart';

class Ecordel {
  int id;
  Author author;
  String title;
  String description;
  String content;
  Xilogravura xilogravura;
  List<String> tags;

  Ecordel({
    this.id,
    this.author,
    this.title,
    this.description,
    this.content,
    this.xilogravura,
    this.tags,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'author': author?.toMap(),
      'title': title,
      'description': description,
      'content': content,
      'xilogravura': xilogravura?.toMap(),
      'tags': tags,
    };
  }

  factory Ecordel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Ecordel(
      id: map['id'],
      author: Author.fromMap(map['author']),
      title: map['title'],
      description: map['description'],
      content: map['content'],
      xilogravura: Xilogravura.fromMap(map['xilogravura']),
      tags: List<String>.from(map['tags']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Ecordel.fromJson(String source) =>
      Ecordel.fromMap(json.decode(source));
}
