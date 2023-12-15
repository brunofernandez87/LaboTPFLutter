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
  bool IconoRelleno = true;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Card(
      clipBehavior: Clip.antiAlias,
      shadowColor: Colors.amberAccent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 10,
      child: Column(
        children: [
          Image.asset(widget.url,
            width: size.width*0.98,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.bottomCenter,
            child: Text(
              widget.text ?? '',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            child: Text(widget.subtext ?? '',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                )),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                IconoRelleno = !IconoRelleno;
              });
            },
            child: Icon(IconoRelleno
                ? Icons.thumb_up_alt
                : Icons.thumb_up_alt_outlined),
          )
        ],
      ),
    );
  }
}
