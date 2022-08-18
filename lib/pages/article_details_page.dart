import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleDetails extends StatelessWidget {
  Article article;
  ArticleDetails(this.article, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height - AppBar().preferredSize.height;

    return Scaffold(
      appBar:AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.18,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.black
        ),
        title: Text(
          article.title,
          textAlign: TextAlign.center,
          maxLines: 4,
          style: const TextStyle(
            color:Colors.black
          ),
          ),
        centerTitle: true,
      ) ,
      body:Container(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: <Widget> [ Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: height * 0.3,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(article.urlImage),
                      fit: BoxFit.cover
                    ),
                    borderRadius: BorderRadius.circular(15)
                  ),
                ),
                SizedBox(height: height * 0.03,),
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
                    fontSize: 30
                  )
                  ),
                ),
                SizedBox(height: height * 0.03,),
                Text(
                  article.description + ". " + article.content,
                  style: const TextStyle(
                    fontSize: 20
                  ),
                  ),
                SizedBox(height: height * 0.03,),
                GestureDetector(
                  onTap: () async{
                    var uri = Uri.parse(article.url);
                    await launchUrl(uri);
                  },
                    child: Text(
                      article.url,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                      ),
                  ),
                SizedBox(height: height * 0.03,),
                Text(
                  article.publishedAt,
                  style: const TextStyle(
                    fontSize: 18
                  ),
                  )
              ],
            ),
          ]
        ),
      ) ,
    );
  }
}