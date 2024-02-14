import 'package:flutter/material.dart';
import 'package:fluttermovie/card.dart';
import 'package:fluttermovie/movies.dart';
// import 'package:flutter_exemple/MovieCard.dart';

class ListMovie extends StatefulWidget {
  ListMovie({super.key, required this.liste});
  List<Movie> liste;
  @override
  State<ListMovie> createState() => _ListMovieState(liste);
}

class _ListMovieState extends State<ListMovie> {
  List<Movie> movies = [];

  _ListMovieState(List<Movie> liste) {
    movies = liste;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // movies.map((e) =>
          // MovieCard(movie: e)
          // ).toList(),
          for (var m in movies) CardObject(obj: m),
        ]);
  }
}
