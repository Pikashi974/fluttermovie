import 'package:flutter/material.dart';
import 'package:fluttermovie/coeur.dart';
import 'package:fluttermovie/home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeApp(), // becomes the route named '/'
    routes: <String, WidgetBuilder>{
      '/coeur': (BuildContext context) => CoeurApp(),
    },
  ));
}
