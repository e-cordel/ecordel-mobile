import 'dart:convert';

import 'package:flutter/foundation.dart';

class Ecordel with ChangeNotifier {
  int id;
  Map<String, dynamic> author;
  String title;
  String description;
  String content;
  String xilogravura; // url

  List<String> tags;
  //  = [
  //   "engraçado",
  //   "regional",
  //   "regionais",
  // ];

  Ecordel({
    this.id,
    this.author,
    this.title,
    this.description,
    this.content,
    this.xilogravura,
    this.tags,
  });

  // factory Ecordel.fromJson(Map<String, dynamic> json) {
  //   return Ecordel(
  //     id: json['id'],
  //     author: json['author'] as String,
  //     tittle: json['title'] as String,
  //     content: json['content'] as String,
  //     description: json['description'] as String,
  //     xilogravura: json['xilogravura'] as String,
  //   );
  // }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'id': this.id,
  //     'author': this.author,
  //     'tittle': this.tittle,
  //     'content': this.content,
  //     'description': this.description,
  //     'xilogravura': this.xilogravura,
  //   };
  // }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'author': author,
      'title': title,
      'description': description,
      'content': content,
      'xilogravura': xilogravura,
      'tags': tags,
    };
  }

  factory Ecordel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Ecordel(
      id: map['id'],
      author: Map<String, dynamic>.from(map['author']),
      title: map['title'],
      description: map['description'],
      content: map['content'],
      xilogravura: map['xilogravura'],
      tags: List<String>.from(map['tags']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Ecordel.fromJson(String source) =>
      Ecordel.fromMap(json.decode(source));
}
