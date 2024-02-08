import 'package:app_laboflutter/Widget/Drawer_menu.dart';
import 'package:app_laboflutter/Widget/card_swipper.dart';
import 'package:app_laboflutter/providers/actores_provider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ActorProvider actorProvider = ActorProvider();
  @override
  Widget build(BuildContext context) {
    const List peliculasyTVseries = [];
    List actores = [];

    actores = actorProvider.obtenerListaActores();

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
