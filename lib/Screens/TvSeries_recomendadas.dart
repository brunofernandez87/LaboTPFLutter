import 'package:app_laboflutter/Widget/Drawer_menu.dart';
import 'package:app_laboflutter/providers/tvseries_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class TvSeriesRecomendada extends StatefulWidget {
  TvSeriesRecomendada({super.key});

  @override
  State<TvSeriesRecomendada> createState() => _TvSeriesRecomendadaState();
}

class _TvSeriesRecomendadaState extends State<TvSeriesRecomendada> {
  List tvseries_puntuadas = [];

  TvSerieProvider tvserie = TvSerieProvider();
  String imagen = "";
  String titulo = "";
  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  Future<void> _initializeData() async {
    try {
      await tvserie.getTvSerieData();
      setState(() {
        imagen = tvserie.obtenerURLIMagen();
        titulo = tvserie.obtenerNombre();
      });
    } catch (error) {
      print("hubo un error $error");
      await _initializeData();
    }
  }

  var indice = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color.fromRGBO(24, 26, 49, 1),
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Recomendacion de TvSeries"),
        ),
        drawer: DrawerMenu(),
        body: imagen != ""
            ? FadeInImage(
                placeholder: const AssetImage('assets/images/loading.gif'),
                image: NetworkImage(
                  "https://image.tmdb.org/t/p/w500/${imagen}",
                ),
                width: size.width * 0.98,
                height: size.height * 0.7,
              )
            : Center(
                 child: Text("hubo un problema espere o toca el boton siguiente"),
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
                                  "titulo": tvserie.obtenerNombre(),
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
                _initializeData();
              },
              child: const Icon(Icons.arrow_forward_outlined),
            )
          ]),
        ));
  }
}
