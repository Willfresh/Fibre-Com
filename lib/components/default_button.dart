import 'package:fibre_com/screens/constants.dart';
import 'package:fibre_com/screens/size_config.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    super.key, required this.text, required this.press,
  });
  final String text;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: press as void Function()?,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        primary: kPrimaryColor,
        minimumSize: Size(180, 50),
      ),
      child: Text(
        text,
        style: TextStyle(
            fontSize: getProportionateScreenWidth(35),
            color: Colors.white),
      ),

    );
  }
}