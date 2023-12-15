import 'package:flutter/material.dart';

class CardImage extends StatefulWidget {
  String url;
  String? text;
  String? subtext;

  CardImage({super.key, required this.url, this.text, this.subtext});

  @override
  State<CardImage> createState() => _CardImageState();
}

class _CardImageState extends State<CardImage> {
  bool IconoRelleno = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Card(
      color: Color.fromRGBO(24, 26, 49, 1),
      clipBehavior: Clip.antiAlias,
      shadowColor: Colors.amberAccent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 10,
      child: Column(
        children: [
          Image.asset(widget.url,
              width: size.width * 0.98, height: size.height * 0.7),
          Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.bottomCenter,
            child: Text(
              widget.text ?? '',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(widget.subtext ?? '',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              )),
          Padding(
            padding: const EdgeInsets.all(9.0),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  IconoRelleno = !IconoRelleno;
                });
              },
              child: Icon(IconoRelleno
                  ? Icons.thumb_up_alt
                  : Icons.thumb_up_alt_outlined),
            ),
          )
        ],
      ),
    );
  }
}
