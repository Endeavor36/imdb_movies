class MovieDetail {
  final String id;
  final String title;
  final String genre;
  final String rating;
  final String rottenTomatoes;
  final String metacritic;
  final String year;
  final String runtime;
  final String language;
  final String plot;
  final List<String> directors;
  final List<String> actors;
  final List<String> writers;
  final String poster;
  final String country;

  MovieDetail({
    required this.id,
    required this.title,
    required this.genre,
    required this.rating,
    required this.rottenTomatoes,
    required this.metacritic,
    required this.year,
    required this.runtime,
    required this.language,
    required this.plot,
    required this.directors,
    required this.actors,
    required this.writers,
    required this.poster,
    required this.country,
  });
}
