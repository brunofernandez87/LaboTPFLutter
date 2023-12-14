import 'package:flutter/material.dart';

class CardImage extends StatefulWidget {
  String url;
  String? text;
  String? subtext;

  CardImage({
    super.key,
    required this.url,
    this.text,
    this.subtext
  });

  @override
  State<CardImage> createState() => _CardImageState();
}

class _CardImageState extends State<CardImage> {
  bool IconoRelleno = true;
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shadowColor: Colors.amberAccent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 10,
      child: Column(
        children: [
          Image.asset(widget.url),
          Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.bottomLeft,
            child: Text(
              widget.text ?? '', 
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            child: Text(
              widget.subtext ?? '',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
              )
            ),
          ),
          ElevatedButton(onPressed:() {
            setState((){
              IconoRelleno= !IconoRelleno;
            });
          }, child: Icon(
            IconoRelleno ? Icons.thumb_up_alt : Icons.thumb_up_alt_outlined
          ),)
        ],
      ),
    );
  }
}