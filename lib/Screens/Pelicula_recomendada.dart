import 'package:app_laboflutter/Widget/Drawer_menu.dart';
import 'package:app_laboflutter/Widget/card_image.dart';
import 'package:app_laboflutter/Widget/card_image2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class PeliculaRecomendada extends StatefulWidget{
  PeliculaRecomendada({super.key});

  @override
  State<PeliculaRecomendada> createState() => _PeliculaRecomendadaState();
}

class _PeliculaRecomendadaState extends State<PeliculaRecomendada> {
  final List peliculas=[
    {"titulo":"Flash","url":"assets/images_peliculas/Flash.jpg"},
    {"titulo":"SawX","url":"assets/images_peliculas/Saw.jpg"},
    {"titulo":"Scary Movie 4","url":"assets/images_peliculas/Scary movie.jpg"},
    {"titulo":"Blue Bettle","url":"assets/images_peliculas/Blue Bettle.jpg"},
    {"titulo":"John Wick 4","url":"assets/images_peliculas/John Wick 4.jpg"},
    {"titulo":"Leo","url":"assets/images_peliculas/Leo.jpg"},
    {"titulo":"Five Nights at Freddy: La pelicula","url":"assets/images_peliculas/Five Nights.jpg"},
    {"titulo":"Los juegos del hambre la balada de pajaros cantores y serpientes","url":"assets/images_peliculas/Los juegos del hambre.jpg"},
    {"titulo":"Barbie","url":"assets/images_peliculas/Barbie.jpg"},
    {"titulo":"Avatar el camino del agua","url":"assets/images_peliculas/avatar.jpg"}
  ];
  List peliculas_puntuadas=[
  ];

  var indice=0;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Recomendacion de peliculas"),
      ),
      drawer: DrawerMenu(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(indice<peliculas.length)
                CardImage2(url:peliculas[indice]["url"])
            else
              Text("no hay mas peliculas")
            ]
            ),
      ),
      
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButtonAnimator: 
      floatingActionButton: Container(
        width: 250,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 133, 174, 240),
          borderRadius: BorderRadius.circular(15)
        ),
        margin: const EdgeInsets.symmetric(vertical: 20),
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(
            heroTag: "fab_history", 
          onPressed:(){
            var largo_fav=peliculas_puntuadas.length;
            var largo=peliculas.length;
            showDialog(context: context, builder: (BuildContext context){
              return AlertDialog(
                title: Text("Peliculas que puntuaste"),
                content:Column(
                  children: [
                    for(var pelicula in peliculas_puntuadas)
                Column(
                  children: [
                    Text("Título: ${pelicula['titulo']}"),
                    Text("Puntuación: ${pelicula['puntuacion'].toString()}"),
                  ],
                )
                ]),
                actions: [
                  TextButton(onPressed:(){ 
                    Navigator.of(context).pop();},
                    child: Text("aceptar"),)
                ],
              );
            });
          },
          backgroundColor: Color.fromARGB(255, 170, 6, 6),
          child: const Icon(Icons.history),
          ),
          FloatingActionButton(
            heroTag: "fab_puntuar",           
            onPressed:(){
            showDialog(context: context, builder: (BuildContext context){
              double Puntuacion=0;
              return AlertDialog(
                title: Text("Pelicula para puntuar"),
          content: Column(
            children: [
              Text("Puntua la pelicula"),
              RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  Puntuacion=rating;
                },
              ),
            ],
          ),
                actions: [
                  TextButton(onPressed:(){ 
                    setState(() {
                          peliculas_puntuadas.add({
                            "titulo":peliculas[indice]["titulo"],
                            "puntuacion": Puntuacion});
                          indice=indice+1;
                      });
                    Navigator.of(context).pop();},
                    child: Text("aceptar"),)
                ],
              );
            });
          },
          backgroundColor: Color.fromARGB(255, 39, 123, 201),
          child: const Icon(Icons.star),
          ),
          FloatingActionButton(
            heroTag: "fab_next",          
            onPressed:(){setState(() {
              indice=indice+1;
            });
          },
          child: const Icon(Icons.arrow_forward_outlined),
          )
          ]
          ),
      )
    );
  }
}