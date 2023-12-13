import 'package:app_laboflutter/Widget/Drawer_menu.dart';
import 'package:flutter/material.dart';

class PeliculaFavorita extends StatelessWidget{
  const PeliculaFavorita({super.key});
  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Peliculas favoritas"),

      ),
      drawer: DrawerMenu(),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: const[
          ListTile(
            title: Text('Maria Fernanda Garcia'),
            subtitle: Text('mfgarcia@gmail.com'),
            leading: Icon(Icons.check_box),
            trailing: Icon(Icons.arrow_right_alt_rounded),
          ),
          ListTile(
            title: Text('Maria Fernanda Garcia'),
            subtitle: Text('mfgarcia@gmail.com'),
            leading: Icon(Icons.check_box),
            trailing: Icon(Icons.arrow_right_alt_rounded),
          ),
          ListTile(
            title: Text('Maria Fernanda Garcia'),
            subtitle: Text('mfgarcia@gmail.com'),
            leading: Icon(Icons.check_box),
            trailing: Icon(Icons.arrow_right_alt_rounded),
          ),
          ListTile(
            title: Text('Maria Fernanda Garcia'),
            subtitle: Text('mfgarcia@gmail.com'),
            leading: Icon(Icons.check_box),
            trailing: Icon(Icons.arrow_right_alt_rounded),
          ),
          ListTile(
            title: Text('Maria Fernanda Garcia'),
            subtitle: Text('mfgarcia@gmail.com'),
            leading: Icon(Icons.check_box),
            trailing: Icon(Icons.arrow_right_alt_rounded),
          ),
          ListTile(
            title: Text('Maria Fernanda Garcia'),
            subtitle: Text('mfgarcia@gmail.com'),
            leading: Icon(Icons.check_box),
            trailing: Icon(Icons.arrow_right_alt_rounded),
          ),
          ListTile(
            title: Text('Maria Fernanda Garcia'),
            subtitle: Text('mfgarcia@gmail.com'),
            leading: Icon(Icons.check_box),
            trailing: Icon(Icons.arrow_right_alt_rounded),
          ),
          ListTile(
            title: Text('Maria Fernanda Garcia'),
            subtitle: Text('mfgarcia@gmail.com'),
            leading: Icon(Icons.check_box),
            trailing: Icon(Icons.arrow_right_alt_rounded),
          ),
          ListTile(
            title: Text('Maria Fernanda Garcia'),
            subtitle: Text('mfgarcia@gmail.com'),
            leading: Icon(Icons.check_box),
            trailing: Icon(Icons.arrow_right_alt_rounded),
          ),
          ListTile(
            title: Text('Maria Fernanda Garcia'),
            subtitle: Text('mfgarcia@gmail.com'),
            leading: Icon(Icons.check_box),
            trailing: Icon(Icons.arrow_right_alt_rounded),
          ),
          ListTile(
            title: Text('Maria Fernanda Garcia'),
            subtitle: Text('mfgarcia@gmail.com'),
            leading: Icon(Icons.check_box),
            trailing: Icon(Icons.arrow_right_alt_rounded),
          ),
          ListTile(
            title: Text('Maria Fernanda Garcia'),
            subtitle: Text('mfgarcia@gmail.com'),
            leading: Icon(Icons.check_box),
            trailing: Icon(Icons.arrow_right_alt_rounded),
          ),
          ListTile(
            title: Text('Maria Fernanda Garcia'),
            subtitle: Text('mfgarcia@gmail.com'),
            leading: Icon(Icons.check_box),
            trailing: Icon(Icons.arrow_right_alt_rounded),
          ),
          ListTile(
            title: Text('Maria Fernanda Garcia'),
            subtitle: Text('mfgarcia@gmail.com'),
            leading: Icon(Icons.check_box),
            trailing: Icon(Icons.arrow_right_alt_rounded),
          ),
          ListTile(
            title: Text('Maria Fernanda Garcia'),
            subtitle: Text('mfgarcia@gmail.com'),
            leading: Icon(Icons.check_box),
            trailing: Icon(Icons.arrow_right_alt_rounded),
          ),
          ListTile(
            title: Text('Maria Fernanda Garcia'),
            subtitle: Text('mfgarcia@gmail.com'),
            leading: Icon(Icons.check_box),
            trailing: Icon(Icons.arrow_right_alt_rounded),
          ),
          ListTile(
            title: Text('Maria Fernanda Garcia'),
            subtitle: Text('mfgarcia@gmail.com'),
            leading: Icon(Icons.check_box),
            trailing: Icon(Icons.arrow_right_alt_rounded),
          ),
          ListTile(
            title: Text('Maria Fernanda Garcia'),
            subtitle: Text('mfgarcia@gmail.com'),
            leading: Icon(Icons.check_box),
            trailing: Icon(Icons.arrow_right_alt_rounded),
          ),
          ListTile(
            title: Text('Maria Fernanda Garcia'),
            subtitle: Text('mfgarcia@gmail.com'),
            leading: Icon(Icons.check_box),
            trailing: Icon(Icons.arrow_right_alt_rounded),
          ),
          ListTile(
            title: Text('Maria Fernanda Garcia'),
            subtitle: Text('mfgarcia@gmail.com'),
            leading: Icon(Icons.check_box),
            trailing: Icon(Icons.arrow_right_alt_rounded),
          ),
          ListTile(
            title: Text('Maria Fernanda Garcia'),
            subtitle: Text('mfgarcia@gmail.com'),
            leading: Icon(Icons.check_box),
            trailing: Icon(Icons.arrow_right_alt_rounded),
          ),
        ],
      ),
    );
  }
  }