import 'package:fibre_com/screens/welcome/components/profDetail/ProScreen.dart';
import 'package:fibre_com/screens/welcome/components/profDetail/prosmallScreen.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../../../models/Offer.dart';

class Professionel extends StatefulWidget{
  @override
  State<Professionel> createState() => _ProfessionelState();
}

class _ProfessionelState extends State<Professionel> {

  List<String> residPic =[
    'assets/images/group-afro-americans-working-together.jpg',
    'assets/images/entreprise.jpg',
  ];
  List<String> imageTags = ['image1', 'image2'];
  List<String> residPicName =[
    'Pro Small',
    'Pro',
  ];
  List<Color> containerColors = [
    Color(0xFFFD3535), // Silver
    Color(0xFFFA2F9B), // Gold

  ];
  List<Color> favoriteIconColors = [
    Color(0xFFFD3535), // Silver
    Color(0xFFFA2F9B), // Gold

  ];
  List<String> residPrix =[
    '55000 FCFA/MOIS',
    '75000 FCFA/MOIS',
  ];

  late PageController _pageController;
  int initialPage =1;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: 0.7,
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
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) => buildContainerSlider(index)
      ),
    );

  }

  Widget buildContainerSlider(int index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, child) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = index - _pageController.page!;
          value = (1-(value.abs() * 0.4)).clamp(0.8, 1.0);

        }
        return Transform.scale(
          scale: value,
          child: Container(
            height: 230,
            width: 250,
            margin: EdgeInsets.only(
              left: index == 0 ? 10 : 10,
              right: index == residPic.length - 1 ? 10 : 0,
              bottom:2,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical:10),
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
                            Navigator.pushNamed(context, ProSmallScreen.routeName);
                            break;
                          case 1:
                            Navigator.pushNamed(context, ProScreen.routeName);
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
                Expanded(
                  child: Row(
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
/*class Professionel extends StatefulWidget{
  @override
  State<Professionel> createState() => _ProfessionelState();
}

class _ProfessionelState extends State<Professionel> {

  List<Map<String, String>> _offerData = [
    {
      "title":"Pro Small",
      "text": "Jusqu’à 250 Mbps + 14 400 minutes d’appel vers Fixe & 120 minutes d’appel vers mobile",
      "text1": "55 000 FCFA/Mois"
    },
    { "title":"Pro",
      "text": "Jusqu’à 300 Mbps + 14 400 minutes d’appel vers Fixe & 120 minutes d’appel vers mobile",
      "text1": "75 000 FCFA/Mois"
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
        separatorBuilder: (context, index) => SizedBox(width: 6),
        itemCount: _offerData.length,
      ),
    );
  }
}*/