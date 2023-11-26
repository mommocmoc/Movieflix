class MovieModel {
  final String title, backdrop;
  final int id;
  static const String baseUrl = "https://image.tmdb.org/t/p/w500";

  MovieModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        backdrop = "$baseUrl${json['backdrop_path']}",
        id = json['id'];
}
