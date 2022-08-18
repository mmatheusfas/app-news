import 'package:flutter/material.dart';
import 'package:news_app/controllers/news_controller.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/repository/api_repository.dart';
import 'package:news_app/widgets/custom_list_tile.dart';


class NewsPage extends StatelessWidget {
  String countryCode;
  NewsPage(this.countryCode, {Key? key}) : super(key: key);

  var controller = NewsController(ApiRepository());

  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.black
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(Icons.newspaper, color: Colors.black,),
            SizedBox(width: width * 0.04),
            const Text("NewsApp", style: TextStyle(color: Colors.black),)
          ],
        ),
      ),
      body: FutureBuilder<List<Article>>(
        future: controller.getArticle(countryCode),
        builder: (context, snapshot){
          if (snapshot.hasError){
            return Text("ERROR");
          }

          if (!snapshot.hasData){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return Scaffold(
            body: Container(
              child: ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: ((context, index) {
                  List <Article> articles = snapshot.data!;
                  Article article = articles[index];

                  return CustomListTile(article, context);
                })
              ),
            ),
          );
        }
        ),
    );
  }
}