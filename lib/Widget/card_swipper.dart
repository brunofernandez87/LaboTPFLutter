import 'package:flutter/material.dart';

class CardSwiper extends StatefulWidget {
  String text;
  List Lista;


  CardSwiper({
    Key? key,
    required this.text,
    required this.Lista,
  }) : super(key: key);

  @override
  State<CardSwiper> createState() => _CardSwiperState();
}

class _CardSwiperState extends State<CardSwiper> {
  bool IconoRelleno= false;
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Container(      
      width: double.infinity,
      height: size.height*0.51,       
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,        
        children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.text ?? '',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,                                
                  color: Color.fromARGB(255, 255, 255, 255)
                ),
              ),
            ),
          Expanded(                 
            child: ListView.builder(                 
              shrinkWrap:true,
              scrollDirection: Axis.horizontal, 
              physics: const BouncingScrollPhysics(),              
              itemCount: widget.Lista.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Container(                                      
                    width: size.width*0.1,
                    height: size.height*0.1,
                    margin: const EdgeInsets.symmetric(
                      vertical: 10, 
                      horizontal:10
                    ),                  
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            widget.Lista[index]['url'],
                            width: 140,
                            height: 160,
                            fit: BoxFit.cover,
                        
                          ),
                        ),
                        const SizedBox(height: 5,),
                        Text(widget.Lista[index]['name']),
                        const SizedBox(height: 15,),
                        Text(
                          widget.Lista[index]['duration'],
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
      ],)
    );
  }
}