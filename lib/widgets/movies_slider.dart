import 'package:flutter/material.dart';

class MovieSlider extends StatelessWidget {
  const MovieSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      color: Colors.red,
      child: Column(
        //Columna sirve para agregar widgets abajo de otro widget
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text('Populares',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),

          //deja un espacio entre widgets
          const SizedBox( height: 5),


          Expanded(
            //toma todo el tamano que queda disponible
            child: ListView.builder(
              scrollDirection: Axis.horizontal, //para hacer scroll horizontal
              itemCount: 20,
              itemBuilder: (BuildContext _, int index) => const _MoviePoster(),
            ),
          ),
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  const _MoviePoster({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 190,
      color: Colors.green,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [

          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details', arguments: 'movie-instance') ,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: const FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'), 
                image: NetworkImage('https://via.placeholder.com/300x400'),
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
