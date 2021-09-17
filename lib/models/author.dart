import 'dart:convert';

class Author {
  int id;
  String name;
  String about;
  String email;

  Author({
    required this.id,
    required this.name,
    required this.about,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'about': about,
      'email': email,
    };
  }

  factory Author.fromMap(Map<String, dynamic> map) {
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
