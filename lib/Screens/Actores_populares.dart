import 'dart:math';

import 'package:app_laboflutter/Widget/Drawer_menu.dart';
import 'package:app_laboflutter/providers/actores_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
//import 'package:provider/provider.dart';

class ActoresPopulares extends StatefulWidget {
  ActoresPopulares({super.key});

  @override
  State<ActoresPopulares> createState() => _ActoresPopularesState();
}

class _ActoresPopularesState extends State<ActoresPopulares> {
  ActorProvider actorProvider = ActorProvider();
  List actoresPuntuados = [];

  var random = Random();
  var indice = 0;

  @override
  Widget build(BuildContext context) {
    //final ActorProvider actorProvider = Provider.of<ActorProvider>(context);

    //for (var i = 0; i < actorProvider.jsonData.length; i++) {
    //  actores.add(
    //      {"nombre": "a", "url": "assets/images_Actores/Farrah Mackenzie.jpg"});
    //  i++;
    //}

    //print(actores);

    final size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Color.fromRGBO(24, 26, 49, 1),
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Actores Populares"),
        ),
        drawer: DrawerMenu(),
        body: FutureBuilder(
          future: actorProvider.getActorData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Si el Future está en espera, muestra un indicador de carga
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              // Si hay un error en la obtención de los datos, muestra un mensaje de error
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              String imagen = actorProvider.obtenerURLIMagen();
              // Si los datos se han obtenido correctamente, muestra la imagen
              return FadeInImage(
                placeholder:
                    const AssetImage("assets/images_Peliculas/Krampus.jpg"),
                image: NetworkImage(
                  "https://image.tmdb.org/t/p/original$imagen",
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
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            FloatingActionButton(
              heroTag: "fab_history",
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Actores que puntuaste"),
                        content: Column(children: [
                          for (var actores in actoresPuntuados)
                            Column(
                              children: [
                                Text("Actor ${actores['nombre']}"),
                                Text(
                                    "Puntuación: ${actores['puntuacion'].toString()}"),
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
                      double puntuacion = 0;
                      return AlertDialog(
                        title: Text("Actor para puntuar"),
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
                                puntuacion = rating;
                              },
                            ),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              setState(() {
                                actoresPuntuados.add({
                                  "nombre": actorProvider.obtenerNombre(),
                                  "puntuacion": puntuacion
                                });
                                print(actoresPuntuados);
                                indice = indice + 1;
                              });
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
                Icons.sentiment_satisfied_outlined,
                color: Colors.amber,
              ),
            ),
            FloatingActionButton(
              heroTag: "fab_next",
              onPressed: () {
                setState(() {
                  indice = indice + 1;
                });
              },
              child: const Icon(Icons.arrow_forward_outlined),
            )
          ]),
        ));
  }
}
