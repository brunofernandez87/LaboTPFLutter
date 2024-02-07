import 'package:app_laboflutter/Widget/Drawer_menu.dart';
import 'package:app_laboflutter/Widget/card_image.dart';
import 'package:flutter/material.dart';

class PeliculaFavorita extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Peliculas"),
        centerTitle: true,
      ),
      drawer: DrawerMenu(),
      body: RefreshIndicator(
            color: Colors.white,
            backgroundColor: Colors.red,
            strokeWidth: 4.0,
            displacement: 40,                                
            onRefresh: () async {
              ;             
            },child:ListView(
        physics: BouncingScrollPhysics(),
        children: [
          CardImage(
            url: 'assets/images_Peliculas/Flash.jpg',
            text: "Flash",
            subtext:
                "Cuando su intento de salvar a su familia altera el futuro sin darse cuenta, Barry Allen queda atrapado en una realidad en la que el general Zod ha regresado y no hay superhéroes a los que recurrir. En última instancia, para salvar el mundo en el que se encuentra y regresar al futuro que conoce, la única esperanza de Barry es escapar de él para salvar su vida. Pero, ¿será suficiente hacer el último sacrificio para reiniciar el universo?",
          ),
          CardImage(
            url: 'assets/images_Peliculas/Krampus.jpg',
            text: 'Krampus',
            subtext:
                'El espíritu de la Navidad simboliza la unión familiar y en la generosidad, pero cuando Max ve que su familia se resquebraja pierde la fe en estos valores. Esto despertará la ira del Krampus, un ser mitológico que acecha al niño y a sus parientes para atormentarles las fiestas y hacerles vivir un infierno. Para enfrentarse al Krampus y salvar la vida, Max y los suyos tendrán que dejar a un lado sus diferencias y unir sus fuerzas contra el monstruo.',
          ),
          CardImage(
            url: 'assets/images_Peliculas/Mario.jpg',
            text: "Mario",
            subtext:
                "Mientras trabaja bajo tierra para arreglar una tubería de agua, los plomeros de Brooklyn Mario y su hermano Luigi son transportados por una misteriosa tubería y llegan a un nuevo mundo mágico. Pero cuando los hermanos se separan, Mario se embarca en una búsqueda épica para encontrar a Luigi. Con la ayuda de un residente del Reino Champiñón, Toad y algo de entrenamiento de la gobernante del Reino Champiñón, la Princesa Peach, Mario conocerá su propio poder",
          ),
          CardImage(
            url: 'assets/images_Peliculas/Saw.jpg',
            text: "Saw X: El juego del miedo",
            subtext:
                "Peter Parker es desenmascarado y ya no puede separar su vida normal de los altos riesgos de ser un súper héroe. Cuando pide ayuda al Doctor Strange para recuperar su secreto, el hechizo crea un agujero en su mundo, liberando a los villanos más poderosos que han luchado con cualquier Spider-Man, en cualquier universo. Ahora Peter debe de superar su reto más grande, que no solo alterara su propio futuro pero el del multiverso, forzándolo a descubrir lo que realmente significa ser Spider-Man.",
          ),
          CardImage(
            url: 'assets/images_Peliculas/Spiderman.jpg',
            text: "Spiderman: Sin camino a casa",
            subtext:
                "Peter Parker es desenmascarado y ya no puede separar su vida normal de los altos riesgos de ser un súper héroe. Cuando pide ayuda al Doctor Strange para recuperar su secreto, el hechizo crea un agujero en su mundo, liberando a los villanos más poderosos que han luchado con cualquier Spider-Man, en cualquier universo. Ahora Peter debe de superar su reto más grande, que no solo alterara su propio futuro pero el del multiverso, forzándolo a descubrir lo que realmente significa ser Spider-Man.",
          ),
          CardImage(
            url: 'assets/images_Peliculas/The marvels.jpg',
            text: "The Marvels",
            subtext:
                "Cuando sus deberes llevan a Carol Danvers, alias Capitana Marvel, a un agujero de gusano anómalo vinculado a un revolucionario Kree, sus poderes se enredan con los de Ms. Marvel y con los de Monica Rambeau, la distanciada sobrina de Carol y astronauta de S.A.B.E.R. Juntas, deberán trabajar en sincronía para salvar al universo como The Marvels",
          ),
          CardImage(
            url: 'assets/images_Peliculas/Oppenheimer.jpg',
            text: "Oppenheimer",
            subtext:
                "Película sobre el físico J. Robert Oppenheimer y su papel como desarrollador de la bomba atómica. Basada en el libro 'American Prometheus: The Triumph and Tragedy of J. Robert Oppenheimer' de Kai Bird y Martin J. Sherwin.",
          ),
          CardImage(
            url: 'assets/images_Peliculas/Wish.jpg',
            text: "Wish: el poder de los deseos",
            subtext:
                "Asha y una pequeña bola de energía ilimitada llamada Star demuestran que cuando la voluntad de un ser humano valiente se conecta con la magia de las estrellas, pueden suceder cosas maravillosas.",
          ),
          CardImage(
            url: 'assets/images_Peliculas/Wonka.jpg',
            text: "Wonka",
            subtext:
                "Willy Wonka, repleto de ideas y decidido a cambiar el mundo con un delicioso bocado a la vez, es una prueba de que las mejores cosas de la vida comienzan con un sueño y, si tienes la suerte de conocer a Willy Wonka, todo es posible.",
          ),
          CardImage(
            url: 'assets/images_Peliculas/Spiderman across.jpg',
            text: "Spiderman across the spiderverse",
            subtext:
                "Después de reunirse con Gwen Stacy, Miles Morales, el amigable Spider-Man del vecindario de tiempo completo de Brooklyn, es catapultado a través del Multiverso, donde se encuentra con un equipo de Spider-People encargado de proteger su existencia. Pero cuando los héroes chocan sobre cómo manejar una nueva amenaza, Miles se enfrenta a las otras arañas y debe redefinir lo que significa ser un héroe para poder salvar a las personas que más ama.",
          )
        ],
      ),
    ));
  }
}
