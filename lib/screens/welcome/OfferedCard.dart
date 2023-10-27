import 'package:flutter/material.dart';
import '../constants.dart ';
import '../size_config.dart';

class OfferedCard extends StatefulWidget {
  @override
  State<OfferedCard> createState() => _OfferedCardState();
}

class _OfferedCardState extends State<OfferedCard> {


  PageController pageController=PageController(viewportFraction: 0.85);
  var _curPgaValue=0.0;
  double _scaleFactor=0.8;
  double _height= getProportionateScreenWidth(200);

  List<String> images = [
    "assets/images/naviguer.jpg", // Remplacez par les chemins de vos images
    "assets/images/streamer.jpg",
    "assets/images/appel1.png",
  ];

  List<String> categories = [
    "Naviguez rapidement sur internet et à haut débit", // Remplacez par vos catégories
    "Streamez vos séries et émissions préférées en toute fluidité",
    "Passez des appels en haute qualité",
  ];

  List<String> numbers = [
    '18', // Remplacez par vos pourcentages
    '15',
    '10',
  ];

  @override
  void initState(){
    super.initState();
    pageController.addListener(() {
      setState(() {
        _curPgaValue= pageController.page!;
      });
    });
  }

  @override
  void dispose(){
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: getProportionateScreenWidth(270),
        child: PageView.builder(
          controller: pageController,
          itemCount: 3,
          itemBuilder: (context, position) {
            return _buildPageItem(position, images[position], categories[position], numbers[position]);
          },
        )
    );
  }

  Widget _buildPageItem(int index, String image, String category, String number) {
    Matrix4 matrix = new Matrix4.identity();
    if(index == _curPgaValue.floor()){
      var currScale = 1-(_curPgaValue-index)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix=Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }else if(index == _curPgaValue.floor()+1){
      var currScale = _scaleFactor+(_curPgaValue-index+1)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix=Matrix4.diagonal3Values(1, currScale, 1);
      matrix=Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }else if(index == _curPgaValue.floor()-1){
      var currScale = 1-(_curPgaValue-index)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix=Matrix4.diagonal3Values(1, currScale, 1);
      matrix=Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }else {
      var currScale=0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, _height*(1-_scaleFactor)/2, 1);
    }

    return Transform(
      transform: matrix,
      child: Container(
          height: getProportionateScreenWidth(270),
          margin: EdgeInsets.only(left: 0,right: 10),
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: Color(0xffefefef),
                    blurRadius: 10.0,
                    offset: Offset(0,5)
                )
              ]
          ),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                children: [
                  Image.asset(
                    image,
                    fit: BoxFit.cover,
                    height: getProportionateScreenWidth(270),
                    width: double.infinity,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xFF343434).withOpacity(0.6),
                              Color(0xff343434).withOpacity(0.17),
                            ])),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(25),
                        vertical: getProportionateScreenWidth(25)),
                    child: Text.rich(TextSpan(
                        style: TextStyle(color: Colors.white),
                        children: [
                          TextSpan(
                              text: "$category\n",
                              style: TextStyle(
                                fontSize: getProportionateScreenWidth(28),
                                fontWeight: FontWeight.bold,
                              )),
                        ])),
                  )
                ],
              )
          )
      ),
    );
  }
}

