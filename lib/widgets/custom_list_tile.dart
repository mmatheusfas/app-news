import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/pages/article_details_page.dart';

Widget CustomListTile(Article article, BuildContext context){

return GestureDetector(
  onTap: (){
    Navigator.push(
      context, 
      MaterialPageRoute(builder: (((context) => ArticleDetails(article))))
      );
  },
  child: Container(
    padding: const EdgeInsets.all(15),
    margin: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: Colors.white,
      boxShadow: const [
        BoxShadow(
        color: Colors.black,
        blurRadius: 3.0 
      )
      ]
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(article.urlImage) 
            ),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(10)
          ),
          child: Text(
            article.source.name, 
            style: const TextStyle(
              color: Colors.white, 
              fontWeight: FontWeight.bold,
              fontSize: 20
              )
            ),
        ),
        const SizedBox(height: 8),
        Text(
          article.title, 
          style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16
          )
        )
      ],
    ),
  ),
);

}