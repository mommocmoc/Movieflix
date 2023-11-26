import 'package:flutter/material.dart';
import 'package:toonflix/screens/detail_screen.dart';

class Movie extends StatelessWidget {
  final String title, backdrop, widgetId;
  final int id;

  const Movie({
    super.key,
    required this.title,
    required this.backdrop,
    required this.id,
    this.widgetId = "popular",
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              title: title,
              backdrop: backdrop,
              id: id,
            ),
            fullscreenDialog: true,
          ),
        );
      },
      child: Column(
        children: [
          Hero(
            tag: id,
            child: Container(
              width: (widgetId == "popular") ? 300 : 250,
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
              child: Image.network(backdrop),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          (widgetId == "popular")
              ? Container()
              : Text(
                  title,
                  style: const TextStyle(
                    fontSize: 22,
                  ),
                ),
        ],
      ),
    );
  }
}
