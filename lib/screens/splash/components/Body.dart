import 'dart:async';

import 'package:fibre_com/components/default_button.dart';
import 'package:fibre_com/screens/constants.dart';
import 'package:fibre_com/screens/sign_in/sign_in_screen.dart';
import 'package:fibre_com/screens/size_config.dart';
import 'package:flutter/material.dart';
import 'package:fibre_com/screens/splash/components/splash_content.dart';
import 'package:fibre_com/screens/constants.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Optez pour la simplicité et la rapidité avec notre service d'abonnement à la fibre optique en ligne",
      "image": "assets/images/Stuck at Home - Working from Home.png"
    },
    {
      "text": "Gagnez du temps en souscrivant à la fibre optique depuis votre canapé",
      "image": "assets/images/Stuck at Home - Happy Place.png"
    },
    {
      "text": "Inscrivez vous et remplissez toutes les informations necessaires pour avoir la fibre chez soi",
      "image": "assets/images/Happy Bunch - Chat (1).png"
    }
  ];
  //Debut fonction slider
  final PageController _pageController = PageController();
  int _currentPageIndex = 0;
  Timer? _timer;

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
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (_currentPageIndex == splashData.length - 1) {
        _currentPageIndex = 0;
        _pageController.jumpToPage(0);
      } else {
        _currentPageIndex++;
        _pageController.nextPage(
            duration: Duration(milliseconds: 500), curve: Curves.ease);
      }
    });
  }

  void _stopTimer() {
    _timer?.cancel();
    _timer = null;
  }
  //fin slider

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: PageView.builder(
              controller: _pageController,
              itemCount: splashData.length,
              itemBuilder: (context, index) => SplashContent(
                text: splashData[index]["text"]!,
                image: splashData[index]["image"]!,
              ),
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
            ),
          ),
          Expanded(
              flex: 1,
              child: Column(
                children: <Widget>[
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      splashData.length,
                      (index) => buildDot(index: index),
                    ),
                  ),
                  Spacer(
                    //flex: 2,
                  ),
                  DefaultButton(
                    text: "Continuer",
                    press: () {
                      Navigator.pushNamed(context, SignInScreen.routeName);
                    },
                  ),
                  Spacer(),
                ],
              ))
        ],
      ),
    ));
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}


