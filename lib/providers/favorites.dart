import 'package:newsapp/models/news_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Favorite {
  Future save({News news}) async {
    final pref = await SharedPreferences.getInstance();

    pref.setStringList(news.title,
        [news.title, news.source, news.imgUrl, news.newsUrl]).then((value) {
      value ? print('Berhasil Simpan') : print('Gagal Simpan');
    });
  }

  Future<List<News>> getAllSavedData() async {
    final pref = await SharedPreferences.getInstance();

    var favs = pref.getKeys();
    List<String> keys = [];
    List<News> listNews = [];
    favs.forEach((element) {
      keys.add(element);
    });
    keys.forEach((element) {
      List<String> content = pref.getStringList(element);
      News news = News(
          title: content[0],
          source: content[1],
          imgUrl: content[2],
          newsUrl: content[3]);

      listNews.add(news);
    });

    print(listNews);
    return listNews;
  }

  Future clearAllfav() async {
    final pref = await SharedPreferences.getInstance();

    pref.clear().then((value) {
      print('Semua data dihapus');
    });
  }

  
  Future clearPerItem({String title}) async {
    final pref = await SharedPreferences.getInstance();

    pref.remove(title);
  }

}
