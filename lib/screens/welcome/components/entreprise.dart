import 'package:flutter/material.dart';
import '../../../models/Offer.dart';
import 'entrepriseDetail/proCyber.dart';
import 'entrepriseDetail/proPlus.dart';

class Entreprise extends StatefulWidget{
  @override
  State<Entreprise> createState() => _EntrepriseState();
}

class _EntrepriseState extends State<Entreprise> {

  List<String> residPic =[
    'assets/images/diverse-team.jpg',
    'assets/images/Cyber.png',
  ];
  List<String> imageTags = ['image1', 'image2'];
  List<String> residPicName =[
    'Pro Plus',
    'Pro Cyber',
  ];
  List<Color> containerColors = [
    Color(0xFF35ECFD), // Silver
    Color(0xFF2F76FA), // Gold

  ];
  List<Color> favoriteIconColors = [
    Color(0xFF35ECFD), // Silver
    Color(0xFF2F76FA), // Gold

  ];
  List<String> residPrix =[
    '125000 FCFA/MOIS',
    '200000 FCFA/MOIS',
  ];

  late PageController _pageController;
  int initialPage =1;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: 0.8,
      initialPage: initialPage,
    );
  }
  @override
  void dispose(){
    super.dispose();
    _pageController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      height :230,
      child: PageView.builder(
          onPageChanged: (value){
            setState(() {
              initialPage=value;
            });
          },
          controller: _pageController,
          itemCount:residPic.length,
          physics: ClampingScrollPhysics(),
          itemBuilder: (context, index) => buildContainerSlider(index)
      ),
    );

  }

  Widget buildContainerSlider(int index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, child) {
        double value = 0;
        if (_pageController.position.haveDimensions) {
          value = index - _pageController.page!;
          value = (1-(value.abs() * 0.2)).clamp(0.8, 1.0);

          // Afficher initialement le premier élément avec une taille plus grande
          if (index == 0) {
            value = (1 - _pageController.page!).clamp(0.8, 1.0);
          }
        }
        return Transform.scale(
          scale: value,
          child: Container(
            height: 230,
            width: 220,
            margin: EdgeInsets.only(
              left: index == 0 ? 20 : 10,
              right: index == residPic.length - 1 ? 30 : 0,
              bottom:2,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical:10),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 10.0,
                      offset: Offset(0, 10.0)
                  )
                ],
                borderRadius: BorderRadius.circular(11),
                color: Colors.white//.withOpacity(0.08),
            ),
            child: Column(
              children: [
                Hero(
                  tag: imageTags[index], // Tag correspondant à l'index sélectionné
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: GestureDetector(
                      onTap: () {
                        // Naviguer vers la page de destination correspondante en fonction de l'index sélectionné
                        switch (index) {
                          case 0:
                            Navigator.pushNamed(context, ProPlusScreen.routeName);
                            break;
                          case 1:
                            Navigator.pushNamed(context, ProCyberScreen.routeName);
                            break;
                        }
                      },
                      child: Image.asset(
                        residPic[index], // Chemin correspondant à l'index sélectionné
                        fit: BoxFit.cover,
                        height: 150,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 21,
                      decoration: BoxDecoration(
                        /*boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 3.0,
                              offset: Offset(0, 3.0)
                          )
                        ],*/
                        borderRadius: BorderRadius.circular(8),
                        color: containerColors[index % containerColors.length],
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Center(
                        child: Text(
                          residPicName[index],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Icon(
                      Icons.favorite_outline,
                      color: favoriteIconColors[index],
                    )
                  ],
                ),
                SizedBox(height: 6),
                Text(
                  residPrix[index],
                  style: TextStyle(
                    //fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

/*class Entreprise extends StatefulWidget{
  @override
  State<Entreprise> createState() => _EntrepriseState();
}

class _EntrepriseState extends State<Entreprise> {

  List<Map<String, String>> _offerData = [
    {
      "title":"Pro Plus",
      "text": "Jusqu’à 350 Mbps + 14 400 minutes d’appel vers Fixe & 120 minutes d’appel vers mobile",
      "text1": "125 000 FCFA/Mois"
    },
    { "title":"Pro Cyber",
      "text": "Jusqu’à 400 Mbps + 14 400 minutes d’appel vers Fixe & 120 minutes d’appel vers mobile",
      "text1": "200 000 FCFA/Mois"
    },
  ];



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      height: 170,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Offer(
          title: _offerData[index]["title"]!,
          text: _offerData[index]["text"]!,
          text1: _offerData[index]["text1"]!,
        ),
        separatorBuilder: (context, index) => SizedBox(width: 1),
        itemCount: _offerData.length,
      ),
    );
  }
}*/