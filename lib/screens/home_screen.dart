import 'package:flutter/material.dart';
import 'package:peliculas_app/providers/movies_provider.dart';
import 'package:peliculas_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //provider de movies
    //obtiene una instancia de moviesprovider
    final moviesProvider = Provider.of<MoviesProvider>(context);
    //print(moviesProvider.popularMovies);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Peliculas en cines'),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: SingleChildScrollView(
          //SingleChildScrollView permite hacer scroll
          //cuando los widgets hijos son mas largos que el tamaño del dispositivo
          child: Column(
        children: [
          //Tarjetas principales
          CardSwiper(movies: moviesProvider.onDisplayMovies),
          //slider de peliculas
          MovieSlider(
            movies: moviesProvider.popularMovies,
            title: 'Populares',
          ),
          //Listado horizontal de peliculas
        ],
      )),
    );
  }
}
