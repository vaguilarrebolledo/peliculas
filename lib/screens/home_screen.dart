import 'package:flutter/material.dart';
import 'package:peliculas_app/widgets/widgets.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Peliculas en cines'),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: (){},
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
                CardSwiper(),
                //slider de peliculas
                MovieSlider(),
                //Listado horizontal de peliculas
          ],)
        ),
    );
  }
}