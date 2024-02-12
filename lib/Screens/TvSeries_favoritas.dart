import 'package:app_laboflutter/Widget/Drawer_menu.dart';
import 'package:app_laboflutter/Widget/card_image.dart';
import 'package:app_laboflutter/providers/tvseries_provider.dart';
import 'package:flutter/material.dart';

class TvSeriesFavorita extends StatefulWidget {
  @override
  _TvSeriesFavoritaState createState() => _TvSeriesFavoritaState();
}

class _TvSeriesFavoritaState extends State<TvSeriesFavorita> {
  List<dynamic> TvSeries = [];
  TvSerieProvider tvseries = TvSerieProvider();

  @override
  void initState() {
    super.initState();
    _refreshData();
  }

  Future<void> _refreshData() async {
    try{
    await tvseries.getTvSeriesData();
    setState(() {
      TvSeries = tvseries.tvseriesLista;
    });}catch(error){
      print("hubo un error");
      await _refreshData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("TvSeries"),
          centerTitle: true,
        ),
        drawer: DrawerMenu(),
        body: RefreshIndicator(
          color: Colors.white,
          backgroundColor: Colors.red,
          strokeWidth: 4.0,
          displacement: 40,
          onRefresh: () async {
            _refreshData();
          },
          child: ListView.builder(
            reverse: false,
            physics: const BouncingScrollPhysics(),
            itemCount: TvSeries.length,
            itemBuilder: (context, index) {
              return CardImage(
                url: TvSeries[index]["poster_path"],
                text: TvSeries[index]["name"],
                subtext: TvSeries[index]["overview"],
              );
            },
          ),
        ));
  }
}
