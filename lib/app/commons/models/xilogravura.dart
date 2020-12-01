import 'dart:convert';

import './xilografo.dart';

class Xilogravura {
  int id;
  String url;
  String description;
  Xilografo xilografo;

  Xilogravura({
    this.id,
    this.url,
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
    if (map == null) return null;

    return Xilogravura(
      id: map['id'],
      url: map['url'],
      description: map['description'],
      xilografo: Xilografo.fromMap(map['xilografo']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Xilogravura.fromJson(String source) =>
      Xilogravura.fromMap(json.decode(source));
}
