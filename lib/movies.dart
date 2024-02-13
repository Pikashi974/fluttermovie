class Movie {
  final int userId;
  final int id;
  final String title;

  const Movie({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'userId': int userId,
        'id': int id,
        'title': String title,
      } =>
        Movie(
          userId: userId,
          id: id,
          title: title,
        ),
      _ => throw const FormatException('Failed to load Movie.'),
    };
  }
}
