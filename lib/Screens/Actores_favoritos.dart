import 'package:app_laboflutter/Widget/Drawer_menu.dart';
import 'package:app_laboflutter/Widget/card_image.dart';
import 'package:flutter/material.dart';

class ActoresFavoritos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Actores favoritos"),
        centerTitle: true,
      ),
      drawer: DrawerMenu(),
      body: ListView.separated(
        physics: BouncingScrollPhysics(),
        itemCount: actoresList.length,
        separatorBuilder: (context, index) {
          return Divider(height: 5);
        },
        itemBuilder: (context, index) {
          return CardImage(
            url: actoresList[index].url,
            text: actoresList[index].text,
            subtext: actoresList[index].subtext,
          );
        },
      ),
    );
  }
}

List<CardImage> actoresList = [
  CardImage(
    url: 'assets/images_Actores/Jeremy Piven.jpg',
    text: "Jeremy Piven",
    subtext:
        "Jeremy Samuel Piven (nacido el 26 de julio de 1965) es un productor de cine y actor estadounidense mejor conocido por su papel de Ari Gold en la serie de televisión Entourage, por la que ganó tres premios Primetime Emmy, así como varias otras nominaciones al Mejor Actor de Reparto.",
  ),
  CardImage(
    url: 'assets/images_Actores/Farrah Mackenzie.jpg',
    text: "Farrah Mackenzie",
    subtext:
        "Farrah Mackenzie es una actriz estadounidense que apareció en 'United States of Al', 'Utopía', y 'Logan Lucky'.",
  ),
  CardImage(
    url: 'assets/images_Actores/Josh hutcherson.jpg',
    text: "Josh hutcherson",
    subtext:
        "Joshua Ryan 'Josh' Hutcherson (nacido el 12 de octubre de 1992) es un actor de cine y televisión estadounidense. Comenzó a trabajar a principios de la década de 2000, apareciendo en varios papeles menores en cine y televisión. Obtuvo una mayor exposición con papeles importantes en las películas de 2005 Little Manhattan y Zathura, la comedia RV de 2006, la película de aventuras familiares de 2007 Firehouse Dog y las adaptaciones cinematográficas de Bridge to Terabithia, Journey to the Center of the Earth y Cirque du Freak: El asistente del vampiro. El 30 de marzo de 2008, Hutcherson ganó un Premio Artista Joven (al Actor Joven Protagónico). Hutcherson también apareció en una edición de Celebrity Teens del exitoso programa MTV Cribs, y está listo para interpretar a Robert en la nueva versión de Red Dawn.",
  ),
  CardImage(
    url: 'assets/images_Actores/Aya Asahina.jpg',
    text: 'Aya Asahina',
    subtext:
        'Aya Asahina es una modelo japonesa de moda y huecograbado, talento, actriz y modelo exclusiva de "Ray". revista. Nació en Sumoto, Hyogo, en 1993. Debutó como actriz en el 2017 en el drama original de Amazon "Tokyo Alice". como Sayuri Enjoji. En 2018 interpretó el papel de Nagisa Kurihara en el drama de TBS "Cheer ☆ Dan". Sus pasatiempos incluyen búlder, kickboxing, cocinar, ver películas y andar en bicicleta de carretera.',
  ),
  CardImage(
    url: 'assets/images_Actores/Sydney Sweeney.jpg',
    text: "Sydney Sweeney",
    subtext:
        "Sydney Bernice Sweeney es una actriz estadounidense. Obtuvo la atención generalizada en la serie de Netflix ¡Todo apesta! (2018) por su papel de Emaline y ha interpretado a Eden en la serie de Hulu The Handmaid's Tale (2018) y a Alice en la miniserie de HBO Sharp Objects (2018). Desde 2019, ha interpretado a Cassie Howard en la serie dramática para adolescentes de HBO Euphoria y a Olivia Mossbacher en The White Lotus. En el cine, tuvo un papel en la comedia dramática de Quentin Tarantino de 2019 Érase una vez en Hollywood, interpretando a Snake, un miembro de la familia Manson.",
  ),
  CardImage(
    url: 'assets/images_Actores/Timothée Chalamet.jpg',
    text: "Timothée Chalamet",
    subtext:
        'Timothée Hal Chalamet (nacido el 27 de diciembre de 1995) es un actor estadounidense. Comenzó su carrera apareciendo en la serie dramática Homeland en 2012. Dos años más tarde, hizo su debut cinematográfico en la comedia dramática Men, Women & Niños y apareció en la película de ciencia ficción Interstellar de Christopher Nolan. Saltó a la fama en la película sobre la mayoría de edad de Luca Guadagnino, Call Me by Your Name (2017). Además de papeles secundarios en las películas de Greta Gerwig Lady Bird (2017) y Mujercitas (2019), asumió papeles protagónicos en Beautiful Boy (2018) y Dune (2021).',
  ),
  CardImage(
    url: 'assets/images_Actores/Ana de Armas.jpg',
    text: "Ana de Armas",
    subtext:
        'Ana de Armas nació en Cuba el 30 de abril de 1988. A los 14 años inició sus estudios en la Escuela Nacional de Teatro de La Habana, donde se graduó después de 4 años. Debutó en el cine con Una rosa de Francia (2006), dirigida por Manuel Gutiérrez Aragón. En 2006 se trasladó a España donde continuó su carrera cinematográfica y empezó a hacer televisión. Actualmente vive entre Madrid y Barcelona. Ana es conocida por sus papeles en Blade Runner 2049 (2017), Knives Out (2019) y No Time to Die (2021).',
  ),
  CardImage(
    url: 'assets/images_Actores/Song Kang.jpg',
    text: "Song Kang",
    subtext:
        'Song Kang es un actor surcoreano de Namoo Actors. Estudió en la Universidad de Konkuk, en el departamento de artes cinematográficas. En 2015, apareció en el corto dramático "Hello Spring", donde tuvo un papel principal. Al inicio de su carrera en 2017, actuó en algunos videos musicales, "Sweet Summer Night" de The Ade y "Love Story" por Suran. También en 2017, debutó oficialmente en "The Liar And His Lover", con un papel secundario. En el 2018, fue nominado al premio Male Rookie Award en los 12th SBS Entertainment Awards. Desde 2017, interpretó pequeños papeles hasta 2019, donde consiguió su primer papel principal oficial en la adaptación del Webtoon, "Love Alarm". Interpretando a Sun Oh en "Love Alarm" Le ha prestado mucha más atención, a partir de 2019 se espera que Kang tenga muchos más papeles principales.',
  ),
  CardImage(
    url: 'assets/images_Actores/Tom Hanks.jpg',
    text: "Tom Hanks",
    subtext:
        'Thomas Jeffrey Hanks (nacido el 9 de julio de 1956) es un actor y cineasta estadounidense. Conocido tanto por sus papeles cómicos como dramáticos, Hanks es una de las estrellas de cine más populares y reconocibles en todo el mundo, y es ampliamente considerado como un ícono cultural estadounidense. /nHanks hizo su gran avance con papeles protagónicos en las comedias Splash (1984) y Big (1988). Ganó dos premios de la Academia consecutivos al Mejor Actor por interpretar a un abogado gay que sufre de SIDA en Filadelfia (1993) y a un joven con un coeficiente intelectual por debajo del promedio en Forrest Gump (1994). Hanks colaboró ​​con el director de cine Steven Spielberg en cinco películas: Salvar al soldado Ryan (1998), Atrápame si puedes (2002), La terminal (2004), El puente de los espías (2015) y The Post (2017), además de la miniserie Band of Brothers de 2001, que lo lanzó como director, productor y guionista./nHanks estuvo en otras películas notables incluyen las comedias románticas Sleepless in Seattle (1993) y You have Got Mail (1998); los dramas Apolo 13 (1995), La milla verde (1999), Náufrago (2000), Camino a la perdición (2002) y Cloud Atlas (2012); y los dramas biográficos Saving Mr. Banks (2013), Captain Phillips (2013), Sully (2016) y A Beautiful Day in the Neighborhood (2019). También apareció como el personaje principal en la serie de películas de Robert Langdon y prestó su voz al Sheriff Woody en la serie de películas Toy Story.',
  ),
  CardImage(
    url: 'assets/images_Actores/Nicolas Cage.jpg',
    text: "Nicolas Cage",
    subtext:
        "Nicolas Cage (nacido Nicolas Kim Coppola) es un actor y cineasta estadounidense; también es sobrino de Francis Ford Coppola. Ha recibido varios elogios, incluido un Premio de la Academia, un Premio del Screen Actors Guild y un Premio Globo de Oro./nDurante los primeros años de su carrera, Cage protagonizó una variedad de películas como Rumble Fish (1983), Racing with the Moon (1984), Peggy Sue Got Married (1986), Raising Arizona (1987), Vampire's Kiss (1989), Salvaje de corazón (1990), Luna de miel en Las Vegas (1992) y Red Rock West (1993). Durante este período, John Willis' Mundo de la pantalla, vol. 36 lo incluyó como uno de los doce nuevos actores prometedores de 1984./nPor su actuación en Leaving Las Vegas (1995), ganó el Premio de la Academia al Mejor Actor. Recibió su segunda nominación al Premio de la Academia por su interpretación de Charlie y Donald Kaufman en Adaptación (2002). Posteriormente apareció en películas más convencionales, como The Rock (1996), Con Air (1997), City of Angels (1998), 8mm (1999), Windtalkers (2002), Lord of War (2005), The Wicker Man ( 2006), Bangkok Dangerous (2008) y Knowing (2009)./nTambién dirigió la película Sonny (2002), por la que fue nominado al Gran Premio Especial en el Festival de Cine de Deauville. Cage es propietario de la productora Saturn Films y ha producido películas como Shadow of the Vampire (2000) y The Life of David Gale (2003). En octubre de 1997, Cage ocupó el puesto 40 en la lista de las 100 mejores estrellas de cine de todos los tiempos de la revista Empire, mientras que al año siguiente ocupó el puesto 37 en la lista de las 100 personas más poderosas de Hollywood de Premiere./nEn la década de 2010, protagonizó Kick-Ass (2010), Drive Angry (2011), Joe (2013), The Runner (2015), Dog Eat Dog (2016), Mom and Dad (2017), Mandy (2018). Spider-Man: Into the Spider-Verse (2018) y Color Out of Space (2019). Su participación en varios géneros cinematográficos durante este tiempo aumentó su popularidad y le valió seguidores de culto.",
  ),
  CardImage(
    url: 'assets/images_Actores/Madeleine Yuna Voyles.jpg',
    text: "Madeleine Yuna Voyles",
    subtext:
        'Madeleine Yuna Voyles (nacida el 3 de septiembre de 2014) es una actriz infantil estadounidense del sudeste asiático (mezcla tailandesa, laosiana y camboyana) y ascendencia germano-estadounidense.',
  ),
  CardImage(
    url: 'assets/images_Actores/Ian Mc Shane.jpg',
    text: "Ian Mc Shane",
    subtext:
        'Ian David McShane (nacido el 29 de septiembre de 1942) es un actor inglés. Aunque ha aparecido en numerosas películas, es por sus papeles televisivos que se le conoce generalmente, empezando por Lovejoy (1986–94) de la BBC y particularmente en el drama occidental de HBO Deadwood (2004–06). Interpretó al rey Silas Benjamin en la serie Kings de NBC y a Barbanegra en Piratas del Caribe: On Stranger Tides.',
  ),
  CardImage(
    url: 'assets/images_Actores/Emma Myers.jpg',
    text: "Emma Myers",
    subtext:
        'Emma Myers (nacida el 2 de abril de 2002) es una actriz estadounidense. Comenzó su carrera como actriz infantil en el 2010, cuando apareció en The Glades. Hizo su gran avance interpretando a Enid Sinclair en la serie de Netflix el miércoles de 2022.',
  ),
  CardImage(
    url: "assets/images_Actores/Myha'la Herrold.jpg",
    text: "Myha'la Herrold",
    subtext:
        "Myha'la Jael Herrold (/maɪˈhɑːlə/; nacida en 1996) es una actriz estadounidense, conocida monónimamente como Myha'la. Es conocida por su papel de Harper Stern en el drama televisivo británico Industry y su papel de Jordan en la película de terror cómica Bodies Bodies Bodies. Actuó principalmente en papeles teatrales antes de ser elegida para Industry, incluida la producción de Broadway de El Libro de Mormón.",
  ),
];
