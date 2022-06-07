import 'package:flutter/material.dart';
import 'package:peliculas_app/models/models.dart';

class MovieSlider extends StatelessWidget {
  final List<Movie> movies;
  final String? title;

  const MovieSlider({
    Key? key, 
    required this.movies, 
    this.title
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      //color: Colors.red,
      child: Column(
        //Columna sirve para agregar widgets abajo de otro widget
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //TODO: si no hay titulo, no se debe mostrar este widget
          if (this.title!= null) 
            Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(this.title!,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),

          //deja un espacio entre widgets
          const SizedBox( height: 5),


          Expanded(
            //toma todo el tamano que queda disponible
            child: ListView.builder(
              scrollDirection: Axis.horizontal, //para hacer scroll horizontal
              itemCount: movies.length,
              itemBuilder: (BuildContext _, int index) =>  _MoviePoster(movies[index]),
            ),
          ),
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {

  final Movie movie;

  const _MoviePoster(this.movie);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 190,
      //color: Colors.green,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [

          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details', arguments: 'movie-instance') ,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage('assets/no-image.jpg'), 
                image: NetworkImage(movie.fullPosterImg),
                width: 130,
                height: 190,
                fit: BoxFit.cover,
              ),
            ),
          ),

          //deja un espacio entre widgets
          const SizedBox( height: 5,),


          const Text(
            'Starwars: El retono del nuevo Jedi asd asd asd asd adsas',
            overflow: TextOverflow.ellipsis,//Sirve para que pueda renderizar cuando el texto es demasiado largo...
            textAlign: TextAlign.center,
          )




        ]),
    );
  }
}
