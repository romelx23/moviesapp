import 'package:flutter/material.dart';
import 'package:pelis/providers/movies_provider.dart';
import 'package:pelis/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    // print(moviesProvider.onDisplayMovies);

    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Peliculas en Cines')),
          elevation: 0,
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search_outlined))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              CardSwiper(movies: moviesProvider.onDisplayMovies),
              SizedBox(height: 20),
              MovieSlider(
                movies: moviesProvider.popularMovies, //populares
                title: 'Populares',
                onNextPage: () => moviesProvider.getPupularMovies(),
              ),
              SizedBox(height: 20),
              MovieSlider(
                  movies: moviesProvider.popularMovies, //populares
                  title: 'Variados',
                  onNextPage: () => moviesProvider.getPupularMovies()),
            ],
          ),
        ));
  }
}
