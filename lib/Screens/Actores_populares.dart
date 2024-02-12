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
  String imagen="";
  String titulo="";
  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  Future<void> _initializeData() async {
    try {
      await actorProvider.getActorData();
      setState(() {
        imagen=actorProvider.obtenerURLIMagen();
        titulo= actorProvider.obtenerNombre();
      });
    } catch (error) {
      print("hubo un error $error");
      await _initializeData();
    }
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Color.fromRGBO(24, 26, 49, 1),
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Actores Populares"),
        ),
        drawer: DrawerMenu(),
        body: imagen != ""?
        FadeInImage(
                placeholder:
                    const AssetImage('assets/images/loading.gif'),
                image: NetworkImage(
                  "https://image.tmdb.org/t/p/w500/${imagen}",
                ),
                width: size.width * 0.98,
                height: size.height * 0.7,
              ):Center(
                child: CircularProgressIndicator(),
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
                _initializeData();
              },
              child: const Icon(Icons.arrow_forward_outlined),
            )
          ]),
        ));
  }
}
