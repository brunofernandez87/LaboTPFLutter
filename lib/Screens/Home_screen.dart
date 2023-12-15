import 'package:app_laboflutter/Widget/Drawer_menu.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(24, 26, 49, 1),
      appBar: AppBar(
        title: const Text('Bienvenido a peliculas BLES'),
        centerTitle: true,
                
      ),
      drawer: DrawerMenu(),          
      body: Center(child: Image.asset("assets/img_logo/logo.png")),
    );
  }
}