import 'package:news_app/models/article_model.dart';

abstract class IApiRepository {
  
  Future <List<Article>> getArticle(String country);

}