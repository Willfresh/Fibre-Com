import 'dart:async';
import 'dart:math' as math;
import 'package:fibre_com/screens/welcome/components/resiDetail/Gold.dart';
import 'package:fibre_com/screens/welcome/components/resiDetail/Platinium.dart';
import 'package:fibre_com/screens/welcome/components/resiDetail/silver.dart';
import 'package:flutter/material.dart';

import '../../../models/Offer.dart';

class Resident extends StatefulWidget{
  @override
  State<Resident> createState() => _ResidentState();
}

class _ResidentState extends State<Resident> {

  List<String> residPic =[
    'assets/images/full-shot-smiley-woman-holding-laptop.jpg',
    'assets/images/wifehusband.png',
    'assets/images/manpc.png'
  ];
  List<String> imageTags = ['image1', 'image2', 'image3'];
  List<String> residPicName =[
    'Silver',
    'Gold',
    'Platinium'
  ];
  List<Color> containerColors = [
    Color(0xFFC0C0C0), // Silver
    Color(0xFFFFD700), // Gold
    Color(0xFFE5E4E2), // Platinum
  ];
  List<Color> favoriteIconColors = [
    Color(0xFFC0C0C0), // Silver
    Color(0xFFFFD700), // Gold
    Color(0xFFE5E4E2), // Platinum
  ];
  List<String> residPrix =[
    '15000 FCFA/MOIS',
    '25000 FCFA/MOIS',
    '30000 FCFA/MOIS'
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
          value = index - (_pageController.page ?? 0);
          value = (value * 0.042).clamp(-1, 1);
        }
        return Transform.rotate(
          angle: math.pi * value,
          child: Container(
            height: 230,
            width: 220,
            margin: EdgeInsets.only(
              left: index == 0 ? 20 : 40,
              right: index == residPic.length - 1 ? 30 : 0,
              //top: 10,
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
                            Navigator.pushNamed(context, SilverScreen.routeName);
                            break;
                          case 1:
                            Navigator.pushNamed(context, GoldScreen.routeName);
                            break;
                          case 2:
                            Navigator.pushNamed(context, PlatiniumScreen.routeName);
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
                        boxShadow: [
                          /*BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 3.0,
                              offset: Offset(0, 3.0)
                          )*/
                        ],
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

/*
SizedBox(
        height :220,
        child: ListView.builder(
            itemCount:residPic.length,
            scrollDirection: Axis.horizontal,
            itemBuilder:(context,index) {
              return Container(
                height:220,
                width:220,
                margin : EdgeInsets.only(
                    left:index == 0? 30:15,
                    right:index == residPic.length -1 ? 30:0
                ),
                padding: const EdgeInsets.all(10),
                decoration:BoxDecoration(
                  borderRadius:BorderRadius.circular(11),
                  color:Colors.grey.withOpacity(0.08),
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(residPic[index],
                        fit: BoxFit.cover,
                        height: 130,),
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 17,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.orange
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Center(
                            child: Text(residPicName[index],
                              style: TextStyle(fontWeight: FontWeight.bold),),
                          ),
                        ),
                        Icon(Icons.favorite_outline)
                      ],
                    ),
                    SizedBox(height: 6,),
                    Text('15000 FCFA/MOIS',
                      style: TextStyle(
                        //fontSize: 10,
                      ),)
                  ],
                ),
              );
            }
        )
    );
*/

/*class _ResidentState extends State<Resident> {
  List<Map<String, String>> _offerData = [
    {
      "title": "Silver",
      "text": "Jusqu’à 50 Mbps + 3600 minutes d’appel vers fixe",
      "text1": "15 000 FCFA/Mois"
    },
    {
      "title": "Gold",
      "text":
      "Jusqu’à 100 Mbps + 3600 minutes d’appel vers fixe & 120 minutes d’appel vers mobile",
      "text1": "25 000 FCFA/Mois"
    },
    {
      "title": "Platinum",
      "text":
      "Jusqu’à 200 Mbps + 3600 minutes d’appel vers fixe & 120 minutes d’appel vers mobile",
      "text1": "30 000 FCFA/Mois"
    }
  ];

  final PageController _pageController = PageController(viewportFraction: 0.8);
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _stopTimer();
    super.dispose();
  }

  void _startTimer() {
    Timer.periodic(Duration(seconds: 5), (timer) {
      final nextPage =
      _currentPageIndex == _offerData.length - 1 ? 0 : _currentPageIndex + 1;
      _pageController.animateToPage(
        nextPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeOut,
      );
    });
  }

  void _stopTimer() {
    _timer?.cancel();
    _timer = null;
  }

  Timer? _timer;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: PageView.builder(
          controller: _pageController,
          itemCount: _offerData.length,
          onPageChanged: (index) {
            setState(() {
              _currentPageIndex = index;
            });
          },
          itemBuilder: (context, index) {
            final isActive = index == _currentPageIndex;
            final transformValue =
            isActive ? -10.0 : (1 - _pageController.page!) * 10.0;
            return Transform.translate(
              offset: Offset(transformValue, 0),
              child: Offer(
                title: _offerData[index]["title"]!,
                text: _offerData[index]["text"]!,
                text1: _offerData[index]["text1"]!,
              ),
            );
          },
        ),
      ),
    );
  }
}
*/