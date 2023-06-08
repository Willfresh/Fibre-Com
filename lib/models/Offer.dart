import 'package:flutter/material.dart';

class Offer extends StatelessWidget {
  const Offer({
    super.key,
    required this.text, required this.title, required this.text1,
  });

  final String title,text,text1;


  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 180,
      width: 250,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Card(
          color: Color(0xFFFFFFFF),
          elevation: 10,
          shadowColor: Colors.yellow,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top:4,left: 4,right: 4,bottom: 4),
              child: Text(title,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top:4,left: 4,right: 4,bottom: 4),
              child: Text(text,
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              height: 2,
              width: 90,
              color: Colors.red,
            ),
            Padding(
              padding: EdgeInsets.only(top:4,left: 4,right: 4,bottom: 4),
              child: Text(text1,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}