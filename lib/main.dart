import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newsapp/views/home_screen.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      title: 'News App',
      initialRoute: HomeScreen.id,
      routes: {
        HomeScreen.id : (context)=> HomeScreen()
      },
    );
  }
}