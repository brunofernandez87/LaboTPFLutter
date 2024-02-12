import 'package:app_laboflutter/Widget/Drawer_menu.dart';
import 'package:app_laboflutter/Widget/card_image.dart';
import 'package:app_laboflutter/providers/pelicula_provider.dart';
import 'package:flutter/material.dart';

class PeliculaFavorita extends StatefulWidget {
  @override
  _PeliculaFavoritaState createState() => _PeliculaFavoritaState();
}

class _PeliculaFavoritaState extends State<PeliculaFavorita> {
  List <dynamic> peliculas=[];
  PeliculasProvider pelicula=PeliculasProvider();

    @override
  void initState() {
    super.initState();
    _refreshData();
  }

  Future<void> _refreshData() async {
    await pelicula.getPeliculaData();
    setState(() {
      peliculas = pelicula.peliculaData;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Peliculas"),
        centerTitle: true,
      ),
      drawer: DrawerMenu(),
      body: RefreshIndicator(
            color: Colors.white,
            backgroundColor: Colors.red,
            strokeWidth: 4.0,
            displacement: 40,                                
            onRefresh: () async {
              await pelicula.getPeliculaData();
              peliculas=pelicula.peliculaData;
            },            
            child: 
            ListView.builder(                  
              reverse: false,
              physics: const BouncingScrollPhysics(),
              itemCount: peliculas.length,
              itemBuilder: (context, index) {        
                return 
                CardImage(
                  url: peliculas[index]["poster_path"],
                  text: peliculas[index]["title"],
                  subtext: peliculas[index]["overview"],
                );
              },
            ),
    ));
  }
}
