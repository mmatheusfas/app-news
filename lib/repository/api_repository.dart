import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/models/article_model.dart';
import 'package:news_app/repository/api_repository_interface.dart';

const URL = "https://newsapi.org/v2/top-headlines?apiKey=fbc21d6908634ab3963e3590fca7fc74&country=";

class ApiRepository implements IApiRepository{

Future <List<Article>> getArticle(String country) async{

  String url = URL + country;

  var uri = Uri.parse(url);

  var res = await http.get(uri);

  if (res.statusCode == 200) {
    
    Map <String, dynamic> dadosJson = jsonDecode(res.body);

    List <Article> articles = dadosJson["articles"].map<Article>(
      (map){
        if (map["author"] == null ){
          map["author"] = '';
        }
        if(map["content"] == null){
          map["content"] = '';
        }
        if (map["id"] == null) {
          map["id"] = '';
        }
        if (map["description"] == null) {
          map["description"] = '';
        }
        if (map["urlToImage"]== null) {
          map["urlToImage"] = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGGdZyn9uFYxbFPsT6GrzNuvKIdQFZXOND2g&usqp=CAU";
        }
        return Article.fromJson(map);
      }
    ).toList();

    return articles;
  }
  throw Exception();
  }
}