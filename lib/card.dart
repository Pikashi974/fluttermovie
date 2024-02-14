import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttermovie/movies.dart';

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
  }

  // void changeList(List obj) {
  //   setState(() {
  //     resultElement = obj;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      children: [
        Image.network('https://image.tmdb.org/t/p/w300/${resultElement.image}'),
        Text(resultElement.title),
        Text(resultElement.date),
        Text("${resultElement.vote}"),
        Text(
          resultElement.overview,
        )
      ],
    ));
  }
}
