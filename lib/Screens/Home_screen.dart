import 'package:app_laboflutter/Widget/Drawer_menu.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bienvenido a peliculas SBEL'),
        centerTitle: true,        
      ),
      drawer: DrawerMenu(),          
      body: const Center(child: Text('Lista de peliculas mas populares')),
    );
  }
}