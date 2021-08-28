import 'dart:convert';

import 'package:ecordel/app/share/models/author.dart';

class Xilogravura {
  int? id;
  String url;
  String? description;
  Author? xilografo;

  Xilogravura({
    this.id,
    required this.url,
    this.description,
    this.xilografo,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'url': url,
      'description': description,
      'xilografo': xilografo?.toMap(),
    };
  }

  factory Xilogravura.fromMap(Map<String, dynamic> map) {
    return Xilogravura(
      id: map['id'],
      url: map['url'],
      description: map['description'],
      xilografo: Author.fromMap(map['xilografo']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Xilogravura.fromJson(String source) =>
      Xilogravura.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Xilogravura(id: $id, url: $url, description: $description, xilografo: $xilografo)';
  }
}
