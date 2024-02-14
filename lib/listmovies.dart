import 'package:flutter/material.dart';
import 'package:fluttermovie/card.dart';
import 'package:fluttermovie/movies.dart';
// import 'package:flutter_exemple/MovieCard.dart';

class ListMovie extends StatefulWidget {
  ListMovie({super.key, required this.liste});
  List<Movie> liste;
  @override
  State<ListMovie> createState() => ListMovieState(liste);
}

class ListMovieState extends State<ListMovie> {
  List<Movie> movies = [];

  ListMovieState(List<Movie> liste) {
    movies = liste;
  }
  void sortByTop() {
    setState(() {
      movies.sort((a, b) => b.vote.compareTo(a.vote));
    });
  }

  void sortByBottom() {
    setState(() {
      movies.sort((a, b) => a.vote.compareTo(b.vote));
    });
  }

  void changeList(List<Movie> obj) {
    setState(() {
      movies = obj;
    });
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
