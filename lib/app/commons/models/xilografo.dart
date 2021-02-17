import 'dart:convert';

class Xilografo {
  int id;
  String name;
  String about;
  String email;
  String description;

  Xilografo({
    this.id,
    this.name,
    this.about,
    this.email,
    this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'about': about,
      'email': email,
      'description': description,
    };
  }

  factory Xilografo.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Xilografo(
      id: map['id'],
      name: map['name'],
      about: map['about'],
      email: map['email'],
      description: map['description'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Xilografo.fromJson(String source) =>
      Xilografo.fromMap(json.decode(source));
}
