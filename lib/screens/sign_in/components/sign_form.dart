import 'package:fibre_com/service/auth.dart';
import 'package:flutter/material.dart';
import '../../../components/custom_suffix_icon.dart';
import '../../../components/default_button.dart';
import '../../../components/form_error.dart';
import '../../constants.dart';
import '../../forgot_password/forgot_password_screen.dart';
import '../../size_config.dart';
import '../../welcome/welcome_screen.dart';

class SignForm extends StatefulWidget{

  @override
  State<SignForm> createState() => _SignFormState();
}

class _SignFormState extends State<SignForm>{
  handleSubmit() async{
    if(!_formKey.currentState!.validate()) return;
    final email = _emailController.value.text;
    final password = _passwordController.value.text;
    setState(() {
      _loading=true;
    });
    await AuthService().signInWithEmailAndPassword(email, password);
    setState(() {
      _loading=false;
    });
  }
  final _formKey = GlobalKey<FormState>();
  bool _loading =false;
  //final List<String> errors= [];
  bool _isPasswordVisible = false; // Indicateur de visibilité du mot de
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  //bool remember = false;
  //bool inLogin =false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Form(
        key: _formKey,
        child: Column(
          children: [
            buildEmailTextFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            buildPasswordFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            /*Row(
              children: [
                /*Checkbox(
                    value: remember,
                    activeColor: kPrimaryColor,
                    onChanged: (value) {
                      setState(() {
                        remember = value!;
                      });
                    }),
                Text("Remenber me"),*/
                Spacer(),
                GestureDetector(
                  onTap: ()=> Navigator.pushNamed(context, ForgotPasswordScreen.routeName),
                  child: Text("Forgot",
                    style: TextStyle(decoration: TextDecoration.underline,
                        color: kPrimaryColor),),
                )
              ],
            ),*/
            //FormError(errors: errors),
            SizedBox(height: getProportionateScreenHeight(30)),

            SizedBox(
              width: getProportionateScreenWidth(400),
              height: getProportionateScreenHeight(56),
              child: ElevatedButton(
                onPressed:() => handleSubmit(),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  primary: kPrimaryColor,
                ),
                child: _loading? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(color: Colors.white,strokeWidth: 2,),
                ):Text("Se connecter",style: TextStyle(
                    fontSize: getProportionateScreenWidth(38),
                    color: Colors.white),),
              ),
            ),
          ],
        ));
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      controller: _passwordController,
      obscureText: !_isPasswordVisible, // Camouflage du mot de passe si _isPasswordVisible est false
      decoration: InputDecoration(
        labelText: 'Mot de passe',
        suffixIcon: IconButton(
          icon: Icon(_isPasswordVisible ? Icons.visibility_off : Icons.visibility), // Utilisation d'icônes différentes en fonction de la visibilité
          onPressed: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible; // Inversion de la visibilité du mot de passe lors de l'appui sur l'icône
            });
          },
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Veuillez entrer votre mot de passe';
        }
        return null;
      },
    );
  }

  TextFormField buildEmailTextFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: _emailController,
      validator: (value){
        if (value!.isEmpty) {
          return 'L\'adresse e-mail est requise';
        } else if (!value.contains('@')) {
          return 'Adresse e-mail invalide';
        }
        return null;
      },
      decoration:  InputDecoration(
          labelText: "Email",
        suffixIcon: IconButton(
          icon: Icon(Icons.email_outlined), onPressed: () {  }, // Utilisation d'icônes différentes en fonction de la visibilité
        ),
      ),
    );
  }
}