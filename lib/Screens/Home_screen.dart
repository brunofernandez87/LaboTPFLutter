import 'package:app_laboflutter/Widget/Drawer_menu.dart';
import 'package:app_laboflutter/Widget/card_swipper.dart';
import 'package:flutter/material.dart';

import '../providers/actores_provider.dart';
import '../providers/peliculas_providers.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ActorProvider actorProvider = ActorProvider();
  List <dynamic> peliculas=[];
  List <dynamic> actores=[];
  PeliculaProvider pelicula=PeliculaProvider();
  bool loading = false;

  @override
  void initState(){
    super.initState();
    _refreshData();
  }

    Future<void> _refreshData() async {
    setState(() {
      loading = true;
    });
    await actorProvider.getActoresData();
    await pelicula.getPeliculaData();
    setState(() {
      peliculas=pelicula.listaPeliculas();
      actores=actorProvider.obtenerListaActores();
      loading=false;
    });}
  @override
  Widget build(BuildContext context) {

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
          if (loading == true)
            CircularProgressIndicator()
          else
          CardSwiper(
             text: "Peliculas y TV Series",
             Lista: peliculas,
          ),
          CardSwiper(
            text: "Actores",
            Lista: actores,
          )
        ]
        ),
      ),
      floatingActionButton: FloatingActionButton(
    onPressed: _refreshData,
    child: Icon(Icons.refresh),
    backgroundColor: Colors.blue,
  ),
  floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
