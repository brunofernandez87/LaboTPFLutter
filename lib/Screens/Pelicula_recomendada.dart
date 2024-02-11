import 'dart:math';

import 'package:app_laboflutter/Widget/Drawer_menu.dart';
import 'package:app_laboflutter/providers/peliculas_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class PeliculaRecomendada extends StatefulWidget {
  PeliculaRecomendada({super.key});

  @override
  State<PeliculaRecomendada> createState() => _PeliculaRecomendadaState();
}

class _PeliculaRecomendadaState extends State<PeliculaRecomendada> {
  List peliculas_puntuadas = [];
  PeliculaProvider pelicula = PeliculaProvider();

  @override
  Widget build(BuildContext context) {
    try{
    pelicula.getPeliculasData();
    }catch(error){
      Center(child: Text("error"),);
    }
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color.fromRGBO(24, 26, 49, 1),
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Recomendacion de peliculas"),
        ),
        drawer: DrawerMenu(),
        body: FutureBuilder(
          future: pelicula.getPeliculasData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Si el Future está en espera, muestra un indicador de carga
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              print("errooor");
              // Si hay un error en la obtención de los datos, muestra un mensaje de error
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              String imagen = pelicula.obtenerURLIMagen();
              // Si los datos se han obtenido correctamente, muestra la imagen
              return FadeInImage(
                placeholder:
                    const AssetImage('assets/images/loading.gif'),
                image: NetworkImage(
                  "https://image.tmdb.org/t/p/w500/$imagen",
                ),
                width: size.width * 0.98,
                height: size.height * 0.7,
              );
            }
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        // floatingActionButtonAnimator:
        floatingActionButton: Container(
          width: 250,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 133, 174, 240),
              borderRadius: BorderRadius.circular(15)),
          margin: const EdgeInsets.symmetric(vertical: 20),
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton(
                heroTag: "fab_history",
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Peliculas que puntuaste"),
                          content: Column(children: [
                            for (var pelicula in peliculas_puntuadas)
                              Column(
                                children: [
                                  Text("Título: ${pelicula['titulo']}"),
                                  Text(
                                      "Puntuación: ${pelicula['puntuacion'].toString()}"),
                                ],
                              )
                          ]),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("aceptar"),
                            )
                          ],
                        );
                      });
                },
                backgroundColor: Color.fromARGB(255, 170, 6, 6),
                child: const Icon(Icons.history),
              ),
              FloatingActionButton(
                heroTag: "fab_puntuar",
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        double Puntuacion = 0;
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
                                itemPadding:
                                    EdgeInsets.symmetric(horizontal: 4.0),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  Puntuacion = rating;
                                },
                              ),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                try{
                                setState(() {
                                  peliculas_puntuadas.add({
                                    "titulo": pelicula.obtenerTitulo(),
                                    "puntuacion": Puntuacion
                                  });
                                });}catch(error){
                                  print(error);
                                }
                                Navigator.of(context).pop();
                              },
                              child: Text("aceptar"),
                            )
                          ],
                        );
                      });
                },
                backgroundColor: Color.fromARGB(255, 39, 123, 201),
                child: const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
              ),
              FloatingActionButton(
                heroTag: "fab_next",
                onPressed: () {
                  try{
                  setState(() {
                    pelicula.getPeliculasData();
                  });}catch(error){
                    print(error);
                  }
                },
                child: const Icon(Icons.arrow_forward_outlined),
              ),
            ],
          ),
        ));
  }
}
