class Movie {
  final String title;
  final String date;
  final double vote;
  final String overview;
  final String image;

  Movie(
      {required this.title,
      required this.date,
      required this.vote,
      required this.overview,
      required this.image});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        title: json["title"] ?? "",
        date: json["release_date"] ?? "",
        overview: json["overview"] ?? "",
        vote: json['vote_average'] != null ? json["vote_average"] : 0,
        image: json["backdrop_path"] ?? "");
  }
}
