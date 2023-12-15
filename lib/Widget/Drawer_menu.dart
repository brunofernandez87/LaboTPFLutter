import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  final List<Map<String, String>> _menuItems = <Map<String, String>>[
    {'route': 'home', 'title': 'Home', 'subtitle': 'Menu principal'},
    {'route': 'favorita', 'title': 'Favorita', 'subtitle': 'Pelicula Favorita'},
    {
      'route': 'recomendada',
      'title': 'Recomendada',
      'subtitle': 'Pelicula Recomendada'
    },
    {
      'route': 'favorita_TvSeries',
      'title': 'Favorita',
      'subtitle': 'TvSeries Recomendada'
    },
    {
      'route': 'recomendada_TvSeries',
      'title': 'Recomendada',
      'subtitle': 'TvSeries Recomendada'
    },
  ];

  DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const _DrawerHeaderAlternative(),
          ...ListTile.divideTiles(
              context: context,
              tiles: _menuItems
                  .map((item) => ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 10),
                        dense: true,
                        minLeadingWidth: 25,
                        iconColor: Colors.blueGrey,
                        title: Text(item['title']!,
                            style: const TextStyle(fontFamily: 'FuzzyBubbles')),
                        subtitle: Text(item['subtitle'] ?? '',
                            style: const TextStyle(
                                fontFamily: 'RobotoMono', fontSize: 11)),
                        leading: const Icon(Icons.video_camera_front_sharp),
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.pushNamed(context, item['route']!);
                        },
                      ))
                  .toList())
        ],
      ),
    );
  }
}

class _DrawerHeaderAlternative extends StatelessWidget {
  const _DrawerHeaderAlternative({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      padding: EdgeInsets.zero,
      child: Stack(children: [
        Image.asset("assets/images_Peliculas/Flash.jpg"),
        Container(
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: const Text(
            'Menu ',
            style: TextStyle(
                fontSize: 13, color: Colors.black54, fontFamily: 'RobotoMono'),
            textAlign: TextAlign.right,
          ),
        ),
      ]),
    );
  }
}
