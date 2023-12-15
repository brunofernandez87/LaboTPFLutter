import 'package:app_laboflutter/Widget/Drawer_menu.dart';
import 'package:app_laboflutter/Widget/card_image.dart';
import 'package:app_laboflutter/Widget/card_image2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class TvSeriesRecomendada extends StatefulWidget {
  TvSeriesRecomendada({super.key});

  @override
  State<TvSeriesRecomendada> createState() => _TvSeriesRecomendadaState();
}

class _TvSeriesRecomendadaState extends State<TvSeriesRecomendada> {
  final List tvseries = [
    {"titulo": "The Witcher", "url": "assets/images_TvSeries/The Witcher.jpg"},
    {
      "titulo": "Stranger Things",
      "url": "assets/images_TvSeries/Stranger Things.jpg"
    },
    {
      "titulo": "Breaking Bad",
      "url": "assets/images_TvSeries/Breaking Bad.jpg"
    },
    {
      "titulo": "Game of Thrones",
      "url": "assets/images_TvSeries/Game of Thrones.jpg"
    },
    {"titulo": "Friends", "url": "assets/images_TvSeries/Friends.jpg"},
    {"titulo": "The Office", "url": "assets/images_TvSeries/The Office.jpg"},
    {
      "titulo": "Black Mirror",
      "url": "assets/images_TvSeries/Black Mirror.jpg"
    },
    {"titulo": "The Crown", "url": "assets/images_TvSeries/The Crown.jpg"},
    {"titulo": "Sherlock", "url": "assets/images_TvSeries/Sherlock.jpg"},
    {"titulo": "Westworld", "url": "assets/images_TvSeries/Westworld.jpg"},
    {
      "titulo": "The Umbrella Academy",
      "url": "assets/images_TvSeries/The Umbrella Academy.jpg"
    },
    {
      "titulo": "Peaky Blinders",
      "url": "assets/images_TvSeries/Peaky Blinders.jpg"
    },
    {"titulo": "Narcos", "url": "assets/images_TvSeries/Narcos.jpg"},
    {"titulo": "Mindhunter", "url": "assets/images_TvSeries/Mindhunter.jpg"},
    {
      "titulo": "The Simpsons",
      "url": "assets/images_TvSeries/The Simpsons.jpg"
    },
    {
      "titulo": "The Mandalorian",
      "url": "assets/images_TvSeries/The Mandalorian.jpg"
    },
    {"titulo": "Fargo", "url": "assets/images_TvSeries/Fargo.jpg"},
    {"titulo": "Ozark", "url": "assets/images_TvSeries/Ozark.jpg"},
    {"titulo": "Money Heist", "url": "assets/images_TvSeries/Money Heist.jpg"},
    {
      "titulo": "Brooklyn Nine-Nine",
      "url": "assets/images_TvSeries/Brooklyn Nine-Nine.jpg"
    }
  ];
  List tvseries_puntuadas = [];

  var indice = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Recomendacion de TvSeries"),
        ),
        drawer: DrawerMenu(),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            if (indice < tvseries.length)
              CardImage2(url: tvseries[indice]["url"])
            else
              Text("No hay mas series")
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
                var largo_fav = tvseries_puntuadas.length;
                var largo = tvseries.length;
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Peliculas que puntuaste"),
                        content: Column(children: [
                          for (var tvseries in tvseries_puntuadas)
                            Column(
                              children: [
                                Text("Título: ${tvseries['titulo']}"),
                                Text(
                                    "Puntuación: ${tvseries['puntuacion'].toString()}"),
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
                        title: Text("Serie para puntuar"),
                        content: Column(
                          children: [
                            Text("Puntua la serie"),
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
                                tvseries_puntuadas.add({
                                  "titulo": tvseries[indice]["titulo"],
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
              child: const Icon(Icons.star),
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
