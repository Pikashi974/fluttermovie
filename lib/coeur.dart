// import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttermovie/listmovies.dart';
import 'package:fluttermovie/movies.dart';
// import 'package:fluttermovie/card.dart';
// import 'package:fluttermovie/movies.dart';
import 'package:http/http.dart' as http;

class CoeurApp extends StatefulWidget {
  const CoeurApp({super.key});

  @override
  State<CoeurApp> createState() => _CoeurAppState();
}

class _CoeurAppState extends State<CoeurApp> {
  late List<Movie> futureCardObject;

  void fetchCardObject(queryElement) async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/search/movie?api_key=26a145d058cf4d1b17cbf084ddebedec&query=${queryElement}&language=fr-FR'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load CardObject');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme().copyWith(
          bodyMedium: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            textStyle: TextStyle(fontSize: 20.0),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Flutter CardObject!'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.0))),
                  ),
                  child: Text("Acceuil"),
                ),
                OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/coeur');
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.0))),
                  ),
                  child: Text("Coup de Coeur"),
                ),
              ],
            ),
            ListMovie(
              liste: futureCardObject,
            )
          ],
        ),
      ),
    );
  }
}
