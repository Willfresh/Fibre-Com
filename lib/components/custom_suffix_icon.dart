import 'package:fibre_com/screens/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSuffixIcon extends StatelessWidget {
  const CustomSuffixIcon({
    super.key, required this.svgIcon,
  });
  final String svgIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10),
      child: SvgPicture.asset(svgIcon,
      height: getProportionateScreenWidth(40),),
    );
  }
}