import 'package:app_laboflutter/Widget/Drawer_menu.dart';
import 'package:app_laboflutter/Widget/card_swipper.dart';
//import 'package:app_laboflutter/providers/actores_provider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //ActorProvider actorProvider = ActorProvider();
  @override
  Widget build(BuildContext context) {
    const List peliculasyTVseries = [
      {
        'url': 'assets/images_Peliculas/Avatar.jpg',
        'name': 'Avatar: El camino del agua',
        'duration': 'Duracion: 2h 39m'
      },
      {
        'url': 'assets/images_Peliculas/Five Nights.jpg',
        'name': 'Five Nights at Freddy: La pelicula',
        'duration': 'Duracion: 1h 50m'
      },
      {
        'url': 'assets/images_Peliculas/Flash.jpg',
        'name': 'Flash',
        'duration': 'Duracion: 1h 30m'
      },
      {
        'url': 'assets/images_Peliculas/Leo.jpg',
        'name': 'Leo',
        'duration': 'Duracion: 1h 42m'
      },
      {
        'url': 'assets/images_Peliculas/Saw.jpg',
        'name': 'Saw X',
        'duration': 'Duracion: 1h'
      },
      {
        'url': 'assets/images_Peliculas/Spiderman.jpg',
        'name': 'Spiderman: No way home',
        'duration': 'Duracion: 1h 30m'
      },
      {
        'url': 'assets/images_Peliculas/Wonka.jpg',
        'name': 'Wonka',
        'duration': 'Duracion: 1h 57m'
      },
      {
        'url': 'assets/images_TvSeries/Black Mirror.jpg',
        'name': 'Black Mirror',
        'duration': 'Duracion: 30 episodios'
      },
      {
        'url': 'assets/images_TvSeries/Narcos.jpg',
        'name': 'Narcos',
        'duration': 'Duracion: 45 episodios'
      },
      {
        'url': 'assets/images_TvSeries/Peaky Blinders.jpg',
        'name': 'Peaky Blinders',
        'duration': 'Duracion: 50 episodios'
      },
      {
        'url': 'assets/images_TvSeries/Sherlock.jpg',
        'name': 'Sherlock',
        'duration': 'Duracion: 27 episodios'
      },
      {
        'url': 'assets/images_TvSeries/Stranger Things.jpg',
        'name': 'Stranger Things',
        'duration': 'Duracion: 45 episodios'
      },
      {
        'url': 'assets/images_TvSeries/Breaking Bad.jpg',
        'name': 'Breaking Bad',
        'duration': 'Duracion: 65 episodios'
      },
      {
        'url': 'assets/images_TvSeries/Ozark.jpg',
        'name': 'Ozark',
        'duration': 'Duracion: 52 episodios'
      }
    ];
    List actores = [];

    //actores = actorProvider.obtenerListaActores();

    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromRGBO(24, 26, 49, 1),
      appBar: AppBar(
        title: const Text('Inicio'),
        centerTitle: true,
      ),
      drawer: DrawerMenu(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(children: [
          Image.asset(
            "assets/img_logo/logo.png",
            width: size.width * 0.98,
            height: size.height * 0.15,
          ),
          CardSwiper(
            text: "Peliculas y TV Series",
            Lista: peliculasyTVseries,
          ),
          CardSwiper(
            text: "Actores",
            Lista: actores,
          )
        ]),
      ),
    );
  }
}
