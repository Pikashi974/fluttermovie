import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttermovie/card.dart';
import 'package:fluttermovie/movies.dart';
// import 'package:flutter_exemple/MovieCard.dart';

class ListMovie extends StatefulWidget {
  ListMovie({Key? key, required this.liste}) : super(key: key);
  List<Movie> liste;
  @override
  State<ListMovie> createState() => ListMovieState();
}

class ListMovieState extends State<ListMovie> {
  void sortByTop() {
    log("Sort by top");
    setState(() {
      widget.liste.sort((a, b) => b.vote.compareTo(a.vote));
    });
  }

  void sortByBottom() {
    log("Sort by flop");
    setState(() {
      widget.liste.sort((a, b) => a.vote.compareTo(b.vote));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          for (var m in widget.liste) CardObject(obj: m),
        ]);
  }
}
