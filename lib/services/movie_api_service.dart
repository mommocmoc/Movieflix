import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toonflix/models/movie_model.dart';
import 'package:toonflix/models/movie_detail_model.dart';

class ApiService {
  static const String baseUrl = "https://movies-api.nomadcoders.workers.dev";
  static const String popular = "popular";
  static const String nowPlaying = "now-playing";
  static const String comingSoon = "coming-soon";

  static Future<List<MovieModel>> getPopularMovies() async {
    List<MovieModel> popularMovieInstances = [];
    final url = Uri.parse('$baseUrl/$popular');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final popularMovies = jsonDecode(response.body);
      for (var popularMovie in popularMovies['results']) {
        final instance = MovieModel.fromJson(popularMovie);
        popularMovieInstances.add(instance);
      }
      return popularMovieInstances;
    }
    throw Error();
  }

  static Future<List<MovieModel>> getNowPlayingMovies() async {
    List<MovieModel> nowPlayingMovieInstances = [];
    final url = Uri.parse('$baseUrl/$nowPlaying');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final nowPlayingMovies = jsonDecode(response.body);
      for (var nowPlayingMovie in nowPlayingMovies['results']) {
        final instance = MovieModel.fromJson(nowPlayingMovie);
        nowPlayingMovieInstances.add(instance);
      }
      return nowPlayingMovieInstances;
    }
    throw Error();
  }

  static Future<List<MovieModel>> getComingSoonMovies() async {
    List<MovieModel> comingSoonMovieInstances = [];
    final url = Uri.parse('$baseUrl/$comingSoon');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final comingSoonMovies = jsonDecode(response.body);
      for (var comingSoonMovie in comingSoonMovies['results']) {
        final instance = MovieModel.fromJson(comingSoonMovie);
        comingSoonMovieInstances.add(instance);
      }
      return comingSoonMovieInstances;
    }
    throw Error();
  }

  static Future<MovieDetailModel> getMovieById(int id) async {
    final url = Uri.parse("$baseUrl/movie?id=$id");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final movie = jsonDecode(response.body);
      return MovieDetailModel.fromJson(movie);
    }
    throw Error();
  }

  // static Future<List<WebtoonEpisodeModel>> getLatestEpisodesById(
  //     String id) async {
  //   List<WebtoonEpisodeModel> episodesInstances = [];
  //   final url = Uri.parse("$baseUrl/$id/episodes");
  //   final response = await http.get(url);
  //   if (response.statusCode == 200) {
  //     final episodes = jsonDecode(response.body);
  //     for (var episode in episodes) {
  //       episodesInstances.add(WebtoonEpisodeModel.fromJson(episode));
  //     }
  //     return episodesInstances;
  //   }
  //   throw Error();
  // }
}
