import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:newsapp/models/news_model.dart';
import 'package:newsapp/providers/favorites.dart';
import 'package:url_launcher/url_launcher.dart';

class FavoritScreen extends StatefulWidget {
  @override
  _FavoritScreenState createState() => _FavoritScreenState();
}

class _FavoritScreenState extends State<FavoritScreen> {
  Favorite favorite = Favorite();

  _launchURL({BuildContext context, String url}) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text('Sorry, Url is not valid')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              icon: Icon(LineIcons.trash_o),
              onPressed: () {
                favorite.clearAllfav();
                 Scaffold.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.redAccent,
                            content: Text('All Data have been deleted')));
                setState(() {
                  
                });
              })
        ],
        centerTitle: true,
        title: Text(
          'Favourites',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: FutureBuilder<List<News>>(
          future: favorite.getAllSavedData(),
          builder: (context, data) {
            if (data.hasData) {
              return ListView.builder(
                  itemCount: data.data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        _launchURL(
                            context: context, url: data.data[index].newsUrl);
                      },
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Container(
                          width: 100,
                          height: 60,
                          child: CachedNetworkImage(
                            imageUrl: data.data[index].imgUrl == null
                                ? 'https://bodybigsize.com/wp-content/uploads/2020/02/noimage-7.png'
                                : data.data[index].imgUrl,
                            placeholder: (context, url) => Center(
                              child: CircularProgressIndicator(),
                            ),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      title: Text(
                        data.data[index].title,
                        style: TextStyle(color: Colors.blue),
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: Text(
                        data.data[index].source,
                        style: TextStyle(fontSize: 12),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          favorite.clearPerItem(title: data.data[index].title);
                           Scaffold.of(context).showSnackBar(
                          SnackBar(
                            duration: Duration(
                              milliseconds: 500
                            ),
                            backgroundColor: Colors.red,
                            content: Text('Deleted News Succedd')));
                          setState(() {
                            
                          });
                        },
                        icon: Icon(
                          LineIcons.trash_o,
                          color: Colors.redAccent,
                        ),
                      ),
                    );
                  });
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
