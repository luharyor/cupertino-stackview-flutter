import 'dart:convert';

import 'package:Flutter_News/models/article_model.dart';
import 'package:http/http.dart' as http;
class News{

  List<ArticleModel> news = [];
  Future<void> getNews() async{
    String url = "http://newsapi.org/v2/top-headlines?country=in&apiKey=1fa5a8c876424c05a1ed0d7775b3639a";
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    if(jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element) {

        if(element["urlToImage"] != null && element['description'] != null){

          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            author: element["author"],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],

          );

          news.add(articleModel);
        }
      });
    }
  }
}
class CategoryNewsClass{

  List<ArticleModel> news = [];
  Future<void> getNews(String category) async{
    String url = "http://newsapi.org/v2/top-headlines?category=$category&country=in&apiKey=1fa5a8c876424c05a1ed0d7775b3639a";
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    if(jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element) {

        if(element["urlToImage"] != null && element['description'] != null){

          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            author: element["author"],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],

          );

          news.add(articleModel);
        }
      });
    }
  }
}