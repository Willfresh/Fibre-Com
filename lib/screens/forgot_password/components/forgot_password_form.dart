import 'package:fibre_com/components/default_button.dart';
import 'package:fibre_com/components/form_error.dart';
import 'package:fibre_com/screens/size_config.dart';
import 'package:flutter/material.dart';

import '../../../components/custom_suffix_icon.dart';
import '../../../components/no_account_text.dart';
import '../../constants.dart';

class ForgotPassForm extends StatefulWidget{
  @override
  State<ForgotPassForm> createState() => _ForgotPassFormState();
}


class _ForgotPassFormState extends State<ForgotPassForm>{
  final _formKey = GlobalKey<FormState>();
  List<String> errors =[];
  late String email;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
        child: Column(
          children: [
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              onSaved: (newValue) => email= newValue!,
              onChanged: (value) {
                if (value.isNotEmpty && errors.contains(kEmailNullError)){
                  setState(() {
                    errors.remove(kEmailNullError);
                  });
                } else if (emailValidatorRegExp.hasMatch(value) && errors.contains(kInvalidEmailError)){
                  setState(() {
                    errors.remove(kInvalidEmailError);
                  });
                }
                return null;
              },
              validator: (value){
                if (value!.isEmpty && !errors.contains(kEmailNullError)){
                  setState(() {
                    errors.add(kEmailNullError);
                  });
                } else if (!emailValidatorRegExp.hasMatch(value) && !errors.contains(kInvalidEmailError)){
                  setState(() {
                    errors.add(kInvalidEmailError);
                  });
                }
                return null;
              },
              decoration:  InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(
                      color: Colors.black
                  ),
                  suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/mail-svgrepo-com.svg",)
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(30),),
            FormError(errors: errors),
            SizedBox(height: SizeConfig.screenHeight! * 0.1),
            DefaultButton(
                text: "Continuer",
                press: (){
                  if (_formKey.currentState!.validate()){
                    //_formKey.currentState!.save();
                    //DO what you want to do
                  }
                }
            ),
            SizedBox(height: SizeConfig.screenHeight! * 0.1),
            NoAcountText(),
          ],
        ));
  }

}