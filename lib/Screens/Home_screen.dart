import 'package:app_laboflutter/Widget/Drawer_menu.dart';
import 'package:app_laboflutter/Widget/card_swipper.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
          CardSwiper(),
          CardSwiper()
        ]),
      ),
      // body: Center(
      //   child:
      //  Image.asset("assets/img_logo/logo.png")
      //  ),
    );
  }
}
