import 'package:flutter/foundation.dart';


class Ecordel with ChangeNotifier {
  int id;
  String author;  
  String tittle;
  String description;
  String content;
  String xilogravura; // url
  

  List<String> tags = [
    "engraçado",
    "regional",
    "regionais",
  ];

  Ecordel({
    this.id,
    this.author,
    this.tittle,
    this.description,
    this.content,
    this.xilogravura,
    
  });

  factory Ecordel.fromJson(Map<String, dynamic> json) {
    return Ecordel(
      id: json['id'],
      author: json['author'] as String,
      tittle: json['title'] as String,
      content: json['content'] as String,
      description: json['description'] as String,
      xilogravura: json['xilogravura'] as String,
      
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'author': this.author,
      'tittle': this.tittle,
      'content': this.content,
      'description': this.description,
      'xilogravura': this.xilogravura,
      
    };
  }
}
