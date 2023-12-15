import 'package:app_laboflutter/Widget/Drawer_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ActoresPopulares extends StatefulWidget {
  ActoresPopulares({super.key});

  @override
  State<ActoresPopulares> createState() => _ActoresPopularesState();
}

class _ActoresPopularesState extends State<ActoresPopulares> {
  final List actores = [
    {"nombre": "Jeremy Piven", "url": "assets/images_Actores/Jeremy Piven.jpg"},
    {
      "nombre": "Farrah Mackenzie",
      "url": "assets/images_Actores/Farrah Mackenzie.jpg"
    },
    {
      "nombre": "Josh hutcherson",
      "url": "assets/images_Actores/Josh hutcherson.jpg"
    },
    {"nombre": "Aya Asahina", "url": "assets/images_Actores/Aya Asahina.jpg"},
    {
      "nombre": "Sydney Sweeney",
      "url": "assets/images_Actores/Sydney Sweeney.jpg"
    },
    {
      "nombre": "Timothée Chalamet",
      "url": "assets/images_Actores/Timothée Chalamet.jpg"
    },
    {"nombre": "Ana de Armas", "url": "assets/images_Actores/Ana de Armas.jpg"},
    {"nombre": "Song Kang", "url": "assets/images_Actores/Song Kang.jpg"},
    {"nombre": "Tom Hanks", "url": "assets/images_Actores/Tom Hanks.jpg"},
    {"nombre": "Nicolas Cage", "url": "assets/images_Actores/Nicolas Cage.jpg"},
    {
      "nombre": "Madeleine Yuna Voyles",
      "url": "assets/images_Actores/Madeleine Yuna Voyles.jpg"
    },
    {"nombre": "Ian Mc Shane", "url": "assets/images_Actores/Ian Mc Shane.jpg"},
    {"nombre": "Emma Myers", "url": "assets/images_Actores/Emma Myers.jpg"},
    {
      "nombre": "Myha'la Herrold",
      "url": "assets/images_Actores/Myha'la Herrold.jpg"
    },
  ];
  List actores_puntuados = [];

  var indice = 0;
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
        body: Center(
child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    if (indice < actores.length)
      Column(
        children: [
          Image.asset(
            actores[indice]["url"],
            width: size.width * 0.98,
            height: size.height * 0.5,
          ),
          Text(
            actores[indice]["nombre"],
            style: TextStyle(
              fontSize: 18.0, 
              fontWeight: FontWeight.bold
              ),
          ),
        ],
      )
    else
      Text("No hay más actores"),
  ],
),
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
                          for (var actores in actores_puntuados)
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
                      double Puntuacion = 0;
                      return AlertDialog(
                        title: Text("Actor para puntuar"),
                        content: Column(
                          children: [
                            Text("Puntua el actor"),
                            RatingBar.builder(
                                initialRating: 3,
                                itemCount: 5,
                                itemBuilder: (context, index){
                                  switch (index) {
                                      case 0:
                                        return Icon(
                                            Icons.sentiment_very_dissatisfied,
                                            color: Colors.red,
                                        );
                                      case 1:
                                        return Icon(
                                            Icons.sentiment_dissatisfied,
                                            color: Colors.redAccent,
                                        );
                                      case 2:
                                        return Icon(
                                            Icons.sentiment_neutral,
                                            color: Colors.amber,
                                        );
                                      case 3:
                                        return Icon(
                                            Icons.sentiment_satisfied,
                                            color: Colors.lightGreen,
                                        );
                                      case 4:
                                          return Icon(
                                            Icons.sentiment_very_satisfied,
                                            color: Colors.green,
                                          );     
                                  }
                                  return Icon(
                                    Icons.sentiment_dissatisfied,
                                    color: Colors.redAccent
                                  );
                                },
                                onRatingUpdate: (rating) {
                                  Puntuacion=rating;
                                },
                            ),
                          ]
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              setState(() {
                                actores_puntuados.add({
                                  "nombre": actores[indice]["nombre"],
                                  "puntuacion": Puntuacion
                                });
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
