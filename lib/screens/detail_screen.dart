import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toonflix/models/movie_detail_model.dart';
import 'package:toonflix/models/webtoon_episode_model.dart';
import 'package:toonflix/services/movie_api_service.dart';

class DetailScreen extends StatefulWidget {
  final String title, backdrop;
  final int id;

  const DetailScreen({
    super.key,
    required this.title,
    required this.backdrop,
    required this.id,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<MovieDetailModel> movie;
  late Future<List<WebtoonEpisodeModel>> episodes;
  late SharedPreferences prefs;
  bool isLiked = false;

  // Future initPrefs() async {
  //   prefs = await SharedPreferences.getInstance();
  //   final likedToons = prefs.getStringList('likedToons');
  //   if (likedToons != null) {
  //     if (likedToons.contains(widget.id) == true) {
  //       setState(() {
  //         isLiked = true;
  //       });
  //     }
  //   } else {
  //     await prefs.setStringList('likedToons', []);
  //   }
  // }

  @override
  void initState() {
    super.initState();
    movie = ApiService.getMovieById(widget.id);
    // episodes = ApiService.getLatestEpisodesById(widget.id);
    // initPrefs();
  }

  // onHeartTap() async {
  //   final likedToons = prefs.getStringList('likedToons');
  //   if (likedToons != null) {
  //     if (isLiked) {
  //       likedToons.remove(widget.id);
  //     } else {
  //       likedToons.add(widget.id);
  //     }
  //     await prefs.setStringList('likedToons', likedToons);
  //     setState(() {
  //       isLiked = !isLiked;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        actions: [
          // IconButton(
          //   onPressed: () {},
          //   icon: Icon(
          //     Icons.chevron_left,
          //   ),
          // ),
        ],
        title: Text(
          "Detail Information",
          style: const TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: widget.id,
                    child: Container(
                      width: 250,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 15,
                            offset: const Offset(10, 10),
                            color: Colors.black.withOpacity(0.3),
                          )
                        ],
                      ),
                      child: Image.network(widget.backdrop),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              FutureBuilder(
                future: movie,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          snapshot.data!.title,
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          snapshot.data!.overview,
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          child: Wrap(
                            children: [
                              for (var genre in snapshot.data!.genres)
                                Container(
                                  margin: const EdgeInsets.only(
                                    right: 10,
                                    bottom: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.green.withOpacity(0.2),
                                  ),
                                  child: Text(
                                    genre['name'],
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        Text(
                          '${snapshot.data!.voteAverage}',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    );
                  }
                  return const Text("...");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
