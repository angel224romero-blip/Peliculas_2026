import 'package:flutter/material.dart';

import '../models/models.dart';

class MovieSlider extends StatelessWidget {
  final List<Movie> movies;
  final String? title;

  const MovieSlider({super.key, required this.movies, this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 260, // Altura total de la sección horizontal
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Título de la sección
          if (title != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                title!,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          const SizedBox(height: 5),

          // Lista horizontal corrida
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal, // <- Esto hace que vaya todo seguido hacia la derecha
              itemCount: movies.length,
              itemBuilder: (_, int index) {
                final movie = movies[index];
                return Container(
                  width: 130, // Ancho de cada póster
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: FadeInImage(
                          placeholder: const AssetImage('assets/no-image.jpeg'),
                          image: NetworkImage(movie.fullPosterImg),
                          width: 130,
                          height: 190,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        movie.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
