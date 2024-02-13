import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';

class CardObject {
  final Image image;
  final String title;
  final String date;
  final String score;
  final String overview;

  const CardObject(
      {required this.image,
      required this.title,
      required this.date,
      required this.score,
      required this.overview});

  factory CardObject.fromJson(Map<String, dynamic> json) {
    json = json["results"];
    log(jsonEncode(json));
    return switch (json) {
      {
        "image": Image image,
        "title": String title,
        "date": String date,
        "score": String score,
        "overview": String overview,
      } =>
        CardObject(
          image: image,
          title: title,
          date: date,
          score: score,
          overview: overview,
        ),
      _ => throw const FormatException('Failed to load Cards.'),
    };
  }
}
