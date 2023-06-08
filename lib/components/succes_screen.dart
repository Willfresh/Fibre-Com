import 'package:flutter/material.dart';
import '../models/payment/payement_screen.dart';
import '../screens/constants.dart ';
import '../screens/size_config.dart';
import '../screens/welcome/welcome_screen.dart';

class SuccessScreen extends StatefulWidget {
  static String routeName= "/success";

  const SuccessScreen({Key? key}) : super(key: key);

  @override
  _SuccessScreenState createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Initialisation de l'animation
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOutBack,
    );

    // Lancement de l'animation
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Stack(
        children: [
          Positioned(
            child: Column(
              children: [
                Expanded(
                  child: Container(

                    decoration: BoxDecoration(

                      color: Colors.yellow.shade400,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(130),
                        bottomRight: Radius.circular(130),
                      ),
                    ),
                    child: Center(
                      child: ScaleTransition(
                        scale: _animation,
                        child: Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Icon(
                            Icons.check,
                            color: Colors.red,
                            size: 80,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(50),),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    "Souscription approuvée, à présent cliquez sur paiement pour effectuer le paiement de la quittance",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[800],
                    ),

                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(50),),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 90),
                  child: ElevatedButton(
                    onPressed: () {
                        Navigator.pushNamed(context, PaymentScreen.routeName);
                      },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      minimumSize: Size(double.infinity, 50),
                      primary: kPrimaryColor,
                    ),
                    child:Text("PAIEMENT",style: TextStyle(
                        fontSize: getProportionateScreenWidth(38),
                        color: Colors.white),),
                  ),
                ),
                SizedBox(height: 70,)
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
