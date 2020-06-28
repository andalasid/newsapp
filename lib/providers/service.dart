import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:newsapp/models/news_model.dart';

class Service {
  Dio dio = Dio();
  List<News> _listNews = List<News>();
  Future<List<News>> getNews({String keyword}) async {
    final apiKey = '530c7fcbc8bf4c75840c1740b8546eb0';
    String url = 'http://newsapi.org/v2/everything?q=$keyword&apiKey=$apiKey';

    try {
      var response = await dio.get(url);
      var rawdata = jsonDecode(response.data);
      print(rawdata);
      return _listNews;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
