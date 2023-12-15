import 'package:app_laboflutter/Widget/Drawer_menu.dart';
import 'package:app_laboflutter/Widget/card_image.dart';
import 'package:flutter/material.dart';

class TvSeriesFavorita extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TvSeries favoritas"),
      ),
      drawer: DrawerMenu(),
      body: ListView.separated(
        physics: BouncingScrollPhysics(),
        itemCount: tvSeriesList.length,
        separatorBuilder: (context, index) {
          return Divider(
              height:
                  5);
        },
        itemBuilder: (context, index) {
          return CardImage(
            url: tvSeriesList[index].url,
            text: tvSeriesList[index].text,
            subtext: tvSeriesList[index].subtext,
          );
        },
      ),
    );
  }
}

List<CardImage> tvSeriesList = [
  CardImage(
    url: 'assets/images_TvSeries/The Witcher.jpg',
    text: "The Witcher",
    subtext:
        "Geralt of Rivia navigates a world filled with monsters and political intrigue.",
  ),
  CardImage(
    url: 'assets/images_TvSeries/Stranger Things.jpg',
    text: "Stranger Things",
    subtext: "A group of kids in a small town encounter strange occurrences.",
  ),
  CardImage(
    url: 'assets/images_TvSeries/Breaking Bad.jpg',
    text: "Breaking Bad",
    subtext: "A high school chemistry teacher turned methamphetamine producer.",
  ),
  CardImage(
    url: 'assets/images_TvSeries/Game of Thrones.jpg',
    text: "Game of Thrones",
    subtext:
        "Epic fantasy series based on the 'A Song of Ice and Fire' novels.",
  ),
  CardImage(
    url: 'assets/images_TvSeries/Friends.jpg',
    text: "Friends",
    subtext:
        "Six friends living in New York navigate the ups and downs of life.",
  ),
  CardImage(
    url: 'assets/images_TvSeries/The Office.jpg',
    text: "The Office",
    subtext:
        "Mockumentary-style sitcom following the lives of office employees.",
  ),
  CardImage(
    url: 'assets/images_TvSeries/Black Mirror.jpg',
    text: "Black Mirror",
    subtext:
        "Anthology series exploring the dark side of technology and society.",
  ),
  CardImage(
    url: 'assets/images_TvSeries/The Crown.jpg',
    text: "The Crown",
    subtext: "Historical drama depicting the reign of Queen Elizabeth II.",
  ),
  CardImage(
    url: 'assets/images_TvSeries/Sherlock.jpg',
    text: "Sherlock",
    subtext:
        "Modern adaptation of Arthur Conan Doyle's classic detective stories.",
  ),
  CardImage(
    url: 'assets/images_TvSeries/Westworld.jpg',
    text: "Westworld",
    subtext:
        "A futuristic theme park blurs the lines between reality and fantasy.",
  ),
  CardImage(
    url: 'assets/images_TvSeries/The Umbrella Academy.jpg',
    text: "The Umbrella Academy",
    subtext:
        "A dysfunctional family of adopted sibling superheroes reunites to solve a mystery.",
  ),
  CardImage(
    url: 'assets/images_TvSeries/Peaky Blinders.jpg',
    text: "Peaky Blinders",
    subtext:
        "A gangster family rises to prominence in post-World War I Birmingham, England.",
  ),
  CardImage(
    url: 'assets/images_TvSeries/Narcos.jpg',
    text: "Narcos",
    subtext: "Chronicles the rise and fall of drug cartels in Colombia.",
  ),
  CardImage(
    url: 'assets/images_TvSeries/Mindhunter.jpg',
    text: "Mindhunter",
    subtext:
        "FBI agents delve into the psychology of serial killers in the late 1970s.",
  ),
  CardImage(
    url: 'assets/images_TvSeries/The Simpsons.jpg',
    text: "The Simpsons",
    subtext:
        "Long-running animated sitcom following the Simpson family in the fictional town of Springfield.",
  ),
  CardImage(
    url: 'assets/images_TvSeries/The Mandalorian.jpg',
    text: "The Mandalorian",
    subtext: "A lone bounty hunter explores the outer reaches of the galaxy.",
  ),
  CardImage(
    url: 'assets/images_TvSeries/Fargo.jpg',
    text: "Fargo",
    subtext: "An anthology series featuring dark and comedic crime stories.",
  ),
  CardImage(
    url: 'assets/images_TvSeries/Ozark.jpg',
    text: "Ozark",
    subtext:
        "A financial planner is forced to relocate his family after a money-laundering scheme goes wrong.",
  ),
  CardImage(
    url: 'assets/images_TvSeries/Money Heist.jpg',
    text: "Money Heist",
    subtext:
        "A criminal mastermind, known as 'The Professor', plans and executes heists on the Royal Mint of Spain and the Bank of Spain.",
  ),
  CardImage(
    url: 'assets/images_TvSeries/Brooklyn Nine-Nine.jpg',
    text: "Brooklyn Nine-Nine",
    subtext:
        "A lighthearted comedy following the detectives of the 99th precinct.",
  )
];
