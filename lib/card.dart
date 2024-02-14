import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttermovie/movies.dart';
import 'package:http/http.dart' as http;

class CardObject extends StatefulWidget {
  CardObject({super.key, required this.obj});
  Movie obj;

  @override
  State<CardObject> createState() => CardObjectState(obj);
}

class CardObjectState extends State<CardObject> {
  late Movie resultElement;
  CardObjectState(obj) {
    resultElement = obj;
    // convertGenre(resultElement);
  }

  //
  String genres = "";

  void convertGenre(Movie movie) async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/genre/movie/list?api_key=26a145d058cf4d1b17cbf084ddebedec'));
    String genreText = "";
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.;
      var jsonBody = jsonDecode(response.body)["genres"];
      for (var genre in movie.genre) {
        for (var i = 0; i < jsonBody.length; i++) {
          var element = jsonBody[i].id;
          log(element);
          if (element == genre) {
            genreText += "${jsonBody[i]["name"]},";
          }
        }
      }
    }
    setState(() {
      genres = genreText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      children: [
        Image.network('https://image.tmdb.org/t/p/w300/${resultElement.image}'),
        Text(resultElement.title),
        Text(resultElement.date),
        Text(
          genres,
        ),
        Text("${resultElement.vote}"),
      ],
    ));
  }
}
