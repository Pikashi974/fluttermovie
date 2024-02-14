class Movie {
  final String title;
  final String date;
  final double vote;
  final List genre;
  final String image;

  Movie(
      {required this.title,
      required this.date,
      required this.vote,
      required this.genre,
      required this.image});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        title: json["title"] ?? "",
        date: json["release_date"] ?? "",
        genre: json["genre_ids"] ?? "",
        vote: json['vote_average'] != null ? json["vote_average"] : 0,
        image: json["backdrop_path"] != null
            ? "https://image.tmdb.org/t/p/w300/${json["backdrop_path"]}"
            : "https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Unknown_person.jpg/217px-Unknown_person.jpg");
  }
}
