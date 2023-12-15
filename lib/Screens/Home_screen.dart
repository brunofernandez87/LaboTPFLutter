import 'package:app_laboflutter/Widget/Drawer_menu.dart';
import 'package:app_laboflutter/Widget/card_swipper.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
      const List peliculasyTVseries = [
    {'url':'assets/images_Peliculas/Avatar.jpg','name':'Avatar: El camino del agua','duration':'2h 39m'},
    {'url':'assets/images_Peliculas/Five Nights.jpg','name':'Five Nights at Freddy: La pelicula','duration':'1h 50m'},
    {'url':'assets/images_Peliculas/Flash.jpg','name':'Flash','duration':'1h 30m'},
    {'url':'assets/images_Peliculas/Leo.jpg','name':'Leo','duration':'1h 42m'},
    {'url':'assets/images_Peliculas/Saw.jpg','name':'Saw X','duration':'1h'},
    {'url':'assets/images_Peliculas/Spiderman.jpg','name':'Spiderman: No way home','duration':'1h 30m'},
    {'url':'assets/images_Peliculas/Wonka.jpg','name':'Wonka','duration':'1h 57m'},
    {'url':'assets/images_TVSeries/Black Mirror.jpg','name':'Black Mirror','duration':'30 episodios'},
    {'url':'assets/images_TVSeries/Narcos.jpg','name':'Narcos','duration':'45 episodios'},
    {'url':'assets/images_TVSeries/Peaky Blinders.jpg','name':'Peaky Blinders','duration':'50 episodios'},
    {'url':'assets/images_TVSeries/Sherlock.jpg','name':'Sherlock','duration':'27 episodios'},
    {'url':'assets/images_TVSeries/Stranger Things.jpg','name':'Stranger Things','duration':'45 episodios'},
    {'url':'assets/images_TVSeries/Breaking Bad.jpg','name':'Breaking Bad','duration':'65 episodios'},
    {'url':'assets/images_TVSeries/Ozark.jpg','name':'Ozark','duration':'52 episodios'}
  ];
  const List Actores = [
    {'url':'assets/images_Peliculas/Saw.jpg','name':'Daenerys Targaryen','duration':''},
    {'url':'assets/images_Peliculas/Saw.jpg','name':'Daenerys Targaryen','duration':''},
    {'url':'assets/images_Peliculas/Saw.jpg','name':'Daenerys Targaryen','duration':''},
    {'url':'assets/images_Peliculas/Saw.jpg','name':'Daenerys Targaryen','duration':''},
    {'url':'assets/images_Peliculas/Saw.jpg','name':'Daenerys Targaryen','duration':''},
    {'url':'assets/images_Peliculas/Saw.jpg','name':'Daenerys Targaryen','duration':''},
    {'url':'assets/images_Peliculas/Saw.jpg','name':'Daenerys Targaryen','duration':''},
    {'url':'assets/images_Peliculas/Saw.jpg','name':'Daenerys Targaryen','duration':''},
    {'url':'assets/images_Peliculas/Saw.jpg','name':'Daenerys Targaryen','duration':''},
    {'url':'assets/images_Peliculas/Saw.jpg','name':'Daenerys Targaryen','duration':''},
    {'url':'assets/images_Peliculas/Saw.jpg','name':'Daenerys Targaryen','duration':''},
    {'url':'assets/images_Peliculas/Saw.jpg','name':'Daenerys Targaryen','duration':''},
    {'url':'assets/images_Peliculas/Saw.jpg','name':'Daenerys Targaryen','duration':''},
    {'url':'assets/images_Peliculas/Saw.jpg','name':'Daenerys Targaryen','duration':''}
  ];

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
          CardSwiper(text: "Peliculas y TV Series",Lista: peliculasyTVseries,),
          CardSwiper(text: "Actores",Lista: Actores,)
        ]),
      ),
      // body: Center(
      //   child:
      //  Image.asset("assets/img_logo/logo.png")
      //  ),
    );
  }
}
