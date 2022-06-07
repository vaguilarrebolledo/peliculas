import 'package:flutter/material.dart';

import '../widgets/widgets.dart';


class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO; cambiar luego por una instancia de movie
    final String movie =
        ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Detalle de pelicula'),
      // ),
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(),
          SliverList(
            //lista de slivers
            delegate: SliverChildListDelegate([
               Text('Hola mundo'),
               _PosterAndTitle(),
               _Overview(),
               _Overview(),
               _Overview(),
               CastingCards()
            ]),
          ),
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      //es lo mismo que el AppBar pero tiene comportamiento distinto al hacer scroll
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.only(bottom: 10),
          color: Colors.black12,
          child: const Text(
            'movie.title',
            style: TextStyle(fontSize: 16),
          ),
        ),
        background: const FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage('https://via.placeholder.com/500x300'),
          fit: BoxFit
              .cover, //expandir todo lo que pueda sin perder las dimensiones de la misma imagen
        ),
      ),
    );
    // return SliverAppBar(//aca puedes controlar el ancho del mismo
    //   backgroundColor: Colors.indigo,

    // );
  }
}

class _PosterAndTitle extends StatelessWidget {

  
  const _PosterAndTitle({Key? key}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {

    final textTheme = Theme.of(context).textTheme;



    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      color: Colors.red,
      child: Row(children: [
        ClipRRect(
          //imagen con border redondeados
          borderRadius: BorderRadius.circular(20),
          child: const FadeInImage(
            placeholder: AssetImage('assets/no-image.jpg'),
            image: NetworkImage('https://via.placeholder.com/200x300'),
            height: 150,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, //para dejarlos alineados al principio
          children: [
            Text(
              'movietitle',
              style: textTheme.headline5,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            Text(
              'original.title',
              style: textTheme.subtitle1,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              children: [
                const Icon(Icons.star_outline, size: 15, color: Colors.grey),
                const SizedBox(
                  width: 5,
                ),
                Text('movie.voteAverage',
                    style: textTheme.caption)
              ],
            )
          ],
        )
      ]),
    );
  }
}

class _Overview extends StatelessWidget {
  const _Overview({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Container(
      padding:const EdgeInsets.symmetric(horizontal:30,vertical: 10),
      child: Text('Sit sunt aliqua sunt minim Lorem exercitation. Officia magna occaecat duis excepteur proident voluptate amet officia. Cupidatat veniam proident incididunt labore. Voluptate voluptate Lorem laboris consectetur proident est cillum minim non consequat adipisicing reprehenderit amet. Minim cillum incididunt aliquip ex in Lorem aliqua quis mollit adipisicing minim incididunt nostrud sit,',
      textAlign: TextAlign.justify,
      style: Theme.of(context).textTheme.subtitle1,
      ),
      
      
      
    );
  }
}