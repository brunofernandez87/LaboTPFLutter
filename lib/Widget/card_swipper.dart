import 'package:flutter/material.dart';

class CardSwiper extends StatelessWidget {

  final List _castMovies = <Map<String,String>>[
    {'url':'assets/images_TvSeries/Stranger Things.jpg','actor':'Emilia Clarke','name':'Daenerys Targaryen','duration':'80 episodios.80 episodios.80 episodios.80 episodios.80 episodios.80 episodios.80 episodios.'},
    {'url':'assets/images_Peliculas/Saw.jpg','actor':'Emilia Clarke','name':'Daenerys Targaryen','duration':'80 episodios.80 episodios.80 episodios.80 episodios.80 episodios.80 episodios.80 episodios.'},
    {'url':'assets/images_Peliculas/Saw.jpg','actor':'Emilia Clarke','name':'Daenerys Targaryen','duration':'80 episodios.80 episodios.80 episodios.80 episodios.80 episodios.80 episodios.80 episodios.'},
    {'url':'assets/images_Peliculas/Saw.jpg','actor':'Emilia Clarke','name':'Daenerys Targaryen','duration':'80 episodios.80 episodios.80 episodios.80 episodios.80 episodios.80 episodios.80 episodios.'},
    {'url':'assets/images_Peliculas/Saw.jpg','actor':'Emilia Clarke','name':'Daenerys Targaryen','duration':'80 episodios.80 episodios.80 episodios.80 episodios.80 episodios.80 episodios.80 episodios.'},
    {'url':'assets/images_Peliculas/Saw.jpg','actor':'Emilia Clarke','name':'Daenerys Targaryen','duration':'80 episodios.80 episodios.80 episodios.80 episodios.80 episodios.80 episodios.80 episodios.'},
    {'url':'assets/images_Peliculas/Saw.jpg','actor':'Emilia Clarke','name':'Daenerys Targaryen','duration':'80 episodios.80 episodios.80 episodios.80 episodios.80 episodios.80 episodios.80 episodios.'},
    {'url':'assets/images_Peliculas/Saw.jpg','actor':'Emilia Clarke','name':'Daenerys Targaryen','duration':'80 episodios.80 episodios.80 episodios.80 episodios.80 episodios.80 episodios.80 episodios.'},
    {'url':'assets/images_Peliculas/Saw.jpg','actor':'Emilia Clarke','name':'Daenerys Targaryen','duration':'80 episodios.80 episodios.80 episodios.80 episodios.80 episodios.80 episodios.80 episodios.'},
    {'url':'assets/images_Peliculas/Saw.jpg','actor':'Emilia Clarke','name':'Daenerys Targaryen','duration':'80 episodios.80 episodios.80 episodios.80 episodios.80 episodios.80 episodios.80 episodios.'},
    {'url':'assets/images_Peliculas/Saw.jpg','actor':'Emilia Clarke','name':'Daenerys Targaryen','duration':'80 episodios.80 episodios.80 episodios.80 episodios.80 episodios.80 episodios.80 episodios.'},
    {'url':'assets/images_Peliculas/Saw.jpg','actor':'Emilia Clarke','name':'Daenerys Targaryen','duration':'80 episodios.80 episodios.80 episodios.80 episodios.80 episodios.80 episodios.80 episodios.'},
    {'url':'assets/images_Peliculas/Saw.jpg','actor':'Emilia Clarke','name':'Daenerys Targaryen','duration':'80 episodios.80 episodios.80 episodios.80 episodios.80 episodios.80 episodios.80 episodios.'},
    {'url':'assets/images_Peliculas/Saw.jpg','actor':'Emilia Clarke','name':'Daenerys Targaryen','duration':'80 episodios.80 episodios.80 episodios.80 episodios.80 episodios.80 episodios.80 episodios.'}
  ];

  CardSwiper({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(      
      width: double.infinity,
      height: 320,       
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,        
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Cards inferior', 
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,                                
                color: Colors.black54
              ),
            ),
          ),
          Expanded(                 
            child: ListView.builder(                 
              shrinkWrap:true,
              scrollDirection: Axis.horizontal, 
              physics: const BouncingScrollPhysics(),              
              itemCount: _castMovies.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Container(                                      
                    width: 150,
                    height: 180,
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
                            _castMovies[index]['url'],
                            width: 140,
                            height: 160,
                            fit: BoxFit.cover,
                        
                          ),
                        ),
                        Text(_castMovies[index]['actor'], 
                          style: const TextStyle(fontSize: 17),
                        ),
                        const SizedBox(height: 5,),
                        Text(_castMovies[index]['name']),
                        const SizedBox(height: 15,),
                        Text(
                          _castMovies[index]['duration'],
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