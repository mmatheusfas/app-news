import 'package:news_app/models/article_model.dart';
import 'package:news_app/repository/api_repository_interface.dart';

class NewsController {

  NewsController(IApiRepository apiRepository){
    api = apiRepository;
  }

late IApiRepository api;

Future <List<Article>> getArticle (String country){

try {
  return api.getArticle(country);
} catch (e) {
  throw Exception();
}

}

}