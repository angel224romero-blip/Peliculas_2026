import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/card_swiper.dart';
import 'package:flutter_application_1/widgets/carousel_slider.dart';
import 'package:provider/provider.dart';

import '../providers/movie_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MovieProvider>(context);
    final popular = moviesProvider.popularMovies;
    return Scaffold(
      appBar: AppBar(elevation: 0, title: const Text('peliculas en cines')),
      body: Column(
        children: [
          CardSwiper(movies: moviesProvider.onDisplayMovies),
          MovieSlider(movies: popular, title: 'Populares'),
        ],
      ),
    );
  }
}
