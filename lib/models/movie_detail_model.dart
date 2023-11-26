class MovieDetailModel {
  final String backdrop, title, overview;
  final List<dynamic> genres;
  final double voteAverage;
  static const String baseUrl = "https://image.tmdb.org/t/p/w500";

  MovieDetailModel.fromJson(Map<String, dynamic> json)
      : backdrop = "$baseUrl${json['backdrop_path']}",
        title = json['title'],
        voteAverage = json['vote_average'],
        overview = json['overview'],
        genres = json['genres'];
}
