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
    {"titulo": "Jeremy Piven", "url": "assets/images_Actores/Jeremy Piven.jpg"},
    {
      "titulo": "Farrah Mackenzie",
      "url": "assets/images_Actores/Farrah Mackenzie.jpg"
    },
    {
      "titulo": "Josh hutcherson",
      "url": "assets/images_Actores/Josh hutcherson.jpg"
    },
    {"titulo": "Aya Asahina", "url": "assets/images_Actores/Aya Asahina.jpg"},
    {
      "titulo": "Sydney Sweeney",
      "url": "assets/images_Actores/Sydney Sweeney.jpg"
    },
    {
      "titulo": "Timothée Chalamet",
      "url": "assets/images_Actores/Timothée Chalamet.jpg"
    },
    {"titulo": "Ana de Armas", "url": "assets/images_Actores/Ana de Armas.jpg"},
    {"titulo": "Song Kang", "url": "assets/images_Actores/Song Kang.jpg"},
    {"titulo": "Tom Hanks", "url": "assets/images_Actores/Tom Hanks.jpg"},
    {"titulo": "Nicolas Cage", "url": "assets/images_Actores/Nicolas Cage.jpg"},
    {
      "titulo": "Madeleine Yuna Voyles",
      "url": "assets/images_Actores/Madeleine Yuna Voyles.jpg"
    },
    {"titulo": "Ian Mc Shane", "url": "assets/images_Actores/Ian Mc Shane.jpg"},
    {"titulo": "Emma Myers", "url": "assets/images_TvSeries/Emma Myers.jpg"},
    {
      "titulo": "Myha'la Herrold",
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
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            if (indice < actores.length)
              Image.asset(actores[indice]["url"],
                  width: size.width * 0.98, height: size.height * 0.7)
            else
              Text("No hay mas actores")
          ]),
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
                                Text("Título: ${actores['titulo']}"),
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
                              setState(() {
                                actores_puntuados.add({
                                  "titulo": actores[indice]["titulo"],
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
                Icons.star,
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
