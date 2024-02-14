import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttermovie/card.dart';
import 'package:fluttermovie/listmovies.dart';
import 'package:fluttermovie/movies.dart';
import 'package:http/http.dart' as http;

class HomeApp extends StatefulWidget {
  const HomeApp({super.key});

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  late List<Movie> futureCardObject = [];
  final TextEditingController _textEditingController = TextEditingController();
  // late final ScrollController _scrollController = ScrollController();
  void fetchCardObject(queryElement) async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/search/movie?api_key=26a145d058cf4d1b17cbf084ddebedec&query=$queryElement&language=fr-FR'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      List<Movie> temp = [];
      var jsonBody = jsonDecode(response.body)["results"];
      for (var index = 0; index < jsonBody.length; index++) {
        var movie = jsonBody[index];
        var elementMovie = Movie.fromJson(movie as Map<String, dynamic>);
        // log("${elementMovie}");
        temp.add(elementMovie);
      }
      updateList(temp);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load CardObject');
    }
  }

  void updateList(List<Movie> element) {
    log("Hello");
    setState(() {
      futureCardObject = element;
    });
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
        body: ListView(
          children: [
            Center(child: Text('Flutter Movie!')),
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
            SearchBar(
              controller: _textEditingController,
              padding: const MaterialStatePropertyAll<EdgeInsets>(
                  EdgeInsets.symmetric(horizontal: 16.0)),
              leading: TextButton(
                onPressed: () {
                  fetchCardObject(_textEditingController.text);
                },
                child: const Icon(Icons.search),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.0))),
                  ),
                  child: Text("Top"),
                ),
                OutlinedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.0))),
                  ),
                  child: Text("Flop"),
                ),
              ],
            ),
            Container(
              child: futureCardObject.isNotEmpty
                  ? ListMovie(
                      liste: futureCardObject,
                    )
                  : const Center(child: Text('No items')),
            )
          ],
        ),
      ),
    );
  }
}
