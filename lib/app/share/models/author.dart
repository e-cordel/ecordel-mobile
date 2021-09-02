import 'dart:convert';

class Author {
  int? id;
  String? name;
  String? about;
  String? email;

  Author({
    this.id,
    this.name,
    this.about,
    this.email,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'about': about,
      'email': email,
    };
  }

  static dynamic fromMap(Map<String, dynamic>? map) {
    if (map == null) {
      return Author();
    }
    return Author(
      id: map['id'],
      name: map['name'],
      about: map['about'],
      email: map['email'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Author.fromJson(String source) => Author.fromMap(json.decode(source));
}
