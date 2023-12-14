import 'package:flutter/material.dart';

class CardImage2 extends StatelessWidget{
  String url;
  CardImage2({
    super.key,
    required this.url,
  });
   @override
  Widget build(BuildContext context) {
    return Card( 
      clipBehavior: Clip.antiAlias,      
      shadowColor: Colors.amberAccent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
      elevation: 10,                     
      child: Column(
        children: [
          Image.asset(url), 
        ],        
      ),
      
    );
  }
}