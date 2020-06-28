import 'package:flutter/material.dart';
import 'package:newsapp/views/home_screen.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      initialRoute: HomeScreen.id,
      routes: {
        HomeScreen.id : (context)=> HomeScreen()
      },
    );
  }
}