import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../screens/size_config.dart';
class FormError extends StatelessWidget {
  const FormError({
    super.key,
    required this.errors,
  });

  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          errors.length, (index)=> formErrorText(error: errors[index])),
    );
  }

  Row formErrorText({required String error}) {
    return Row(
      //padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      children: [
        SvgPicture.asset("assets/icons/error-svgrepo-com.svg",
          height: getProportionateScreenHeight(20),
          width: getProportionateScreenWidth(20),),
        SizedBox(width: getProportionateScreenWidth(10),),
        Text(error),
      ],
    );
  }
}