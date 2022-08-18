import 'package:flutter/material.dart';
import 'package:news_app/models/source_model.dart';

class Article {
  Source source;
   String title;
   String description;
   String urlImage;
   String url;
   String publishedAt;
   String content;
   String author;


   Article(
     this.source,
     this.title,
     this.description,
     this.urlImage,
     this.url,
     this.publishedAt,
     this.content,
     this.author
   );

   factory Article.fromJson (Map<String, dynamic> json){

     return Article(
       Source.fromJson(json["source"]),
       json["title"],
       json["description"],
       json["urlToImage"],
       json["url"],
       json["publishedAt"],
       json["content"],
       json["author"]
     );
   }
}