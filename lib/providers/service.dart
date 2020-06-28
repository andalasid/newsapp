import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newsapp/models/news_model.dart';

class Service {
  List<News> _listNews = List<News>();

  Future<List<News>> getNews({String keyword}) async {
    String apiKey = '530c7fcbc8bf4c75840c1740b8546eb0';
    String url = 'http://newsapi.org/v2/everything?q=$keyword&apiKey=$apiKey';

    try {
      var response = await http.get(url);
      var rawdata = jsonDecode(response.body);
      var articles = rawdata['articles'];

      articles.forEach((element){
        News news = News(
          source: element['source']['name'],
          title: element['title'],
          imgUrl: element['urlToImage'],
          newsUrl: element['url']
        );
        _listNews.add(news);
      });
      return _listNews;
    } catch (e) {
      print(e);
      return _listNews = [];
    }
  }
}
