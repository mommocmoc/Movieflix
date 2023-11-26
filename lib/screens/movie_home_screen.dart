import 'package:flutter/material.dart';
import 'package:toonflix/models/movie_model.dart';
import 'package:toonflix/services/movie_api_service.dart';
import 'package:toonflix/widgets/movie_widget.dart';
import 'package:toonflix/widgets/other_movie_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<MovieModel>> popularMovies = ApiService.getPopularMovies();
  final Future<List<MovieModel>> nowPlayingMovies =
      ApiService.getNowPlayingMovies();
  final Future<List<MovieModel>> comingSoonMovies =
      ApiService.getComingSoonMovies();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   elevation: 2,
      //   backgroundColor: Colors.white,
      //   foregroundColor: Colors.green,
      //   title: const Text(
      //     "어늘의 웹툰",
      //     style: TextStyle(
      //       fontSize: 24,
      //     ),
      //   ),
      // ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: popularMovies,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Text(
                            "Popular Movies",
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                        Expanded(child: makePopularList(snapshot))
                      ],
                    );
                  }
                  return const Center(
                    child: Text("...loading"),
                  );
                },
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: nowPlayingMovies,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Text(
                            "Now in Cinemas",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Expanded(child: makeList(snapshot))
                      ],
                    );
                  }
                  return const Center(
                    child: Text("...loading"),
                  );
                },
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: comingSoonMovies,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Text(
                            "Coming Soon",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Expanded(child: makeList(snapshot))
                      ],
                    );
                  }
                  return const Center(
                    child: Text("...loading"),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListView makePopularList(AsyncSnapshot<List<MovieModel>> snapshot) {
    return ListView.separated(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      itemBuilder: (context, index) {
        var movie = snapshot.data![index];
        return Movie(
          title: movie.title,
          backdrop: movie.backdrop,
          id: movie.id,
          widgetId: "popular",
        );
      },
      separatorBuilder: (context, index) => const SizedBox(width: 40),
    );
  }

  ListView makeList(AsyncSnapshot<List<MovieModel>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      itemBuilder: (context, index) {
        var movie = snapshot.data![index];
        return OtherMovie(
          title: movie.title,
          backdrop: movie.backdrop,
          id: movie.id,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(width: 40),
    );
  }
}
