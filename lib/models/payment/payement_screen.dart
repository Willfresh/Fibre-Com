import 'package:flutter/material.dart';
import 'package:flutter_paypal/flutter_paypal.dart';
import 'package:flutter_svg/svg.dart';
import '../../screens/constants.dart ';
import '../../screens/welcome/welcome_screen.dart';

class PaymentScreen extends StatefulWidget {
  static String routeName= "/payment";
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}


class _PaymentScreenState extends State<PaymentScreen> {
  String selectedOption = 'Carte Bancaire'; // Bouton sélectionné
  String enteredAmount = '0'; // Montant entré
  final mobileMoneyNumberController = TextEditingController();
  final mobileMoneyAmountController = TextEditingController();
  final carteBancaireAmountController = TextEditingController();
  final _list = [
    {"label": "Tmoney", "value": "15"},
    {"label": "Flooz", "value": "20"}
  ];
  String _mobileMoney = "15";

  @override
  void dispose() {
   // Nettoyage des contrôleurs
    mobileMoneyNumberController.dispose();
    mobileMoneyAmountController.dispose();
    carteBancaireAmountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        inputDecorationTheme: inputDecorationTheme(),
      ),
      child: Scaffold(

        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/images/cardcredit.png',
                      height: MediaQuery.of(context).size.height * 0.6,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 40,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(42),
                            topRight: Radius.circular(42),
                          ),
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.05,
                          left: MediaQuery.of(context).size.height * 0.02,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, WelcomeScreen.routeName); // Revenir à l'écran précédent
                          },
                          child: SvgPicture.asset(
                            'assets/icons/arrow-left-svgrepo-com.svg',
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                selectedOption = 'Mobile Money';
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              primary: selectedOption == 'Mobile Money'
                                  ? Colors.red
                                  : Colors.grey,
                            ),
                            child: Text('Mobile Money'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                selectedOption = 'Carte Bancaire';
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              primary: selectedOption == 'Carte Bancaire'
                                  ? Colors.blue
                                  : Colors.grey,
                            ),
                            child: Text('Carte Bancaire'),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      if (selectedOption == 'Mobile Money')
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white.withOpacity(0.8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.4),
                                    blurRadius: 3,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: DropdownButton(
                                isExpanded: true,
                                value: _mobileMoney,
                                onChanged: (val) {
                                  setState(() {
                                    _mobileMoney = val as String;
                                  });
                                },
                                style: TextStyle(color: Colors.black),
                                icon: Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.red,
                                ),
                                items: _list
                                    .map((item) => DropdownMenuItem(
                                  child: Text(item["label"]!),
                                  value: item["value"],
                                ))
                                    .toList(),
                              ),
                            ),
                            SizedBox(height: 20),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white.withOpacity(0.8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    blurRadius: 3,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: TextFormField(
                                controller: mobileMoneyNumberController,
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                  labelText: 'Numéro de portable',
                                  //labelStyle: TextStyle(color: Colors.black),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white.withOpacity(0.8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    blurRadius: 3,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: mobileMoneyAmountController,
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                  labelText: 'Montant',
                                  //labelStyle: TextStyle(color: Colors.black),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    enteredAmount = value;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      if (selectedOption == 'Carte Bancaire')
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white.withOpacity(0.8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                blurRadius: 3,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child:TextFormField(
                            keyboardType: TextInputType.number,
                            controller: carteBancaireAmountController,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              labelText: 'Montant',
                              //labelStyle: TextStyle(color: Colors.black),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            onChanged: (value) {
                              setState(() {
                                enteredAmount = value;
                              });
                            },
                          ),
                        ),
                      SizedBox(height: 80),
                      Padding(
                        padding: EdgeInsets.only( bottom: 20),
                        child: ElevatedButton(
                          onPressed: () {
                            // Convertir le montant en FCFA en montant en USD
                            double amountInUSD = double.parse(enteredAmount) / 500;

                            // Effectuer le paiement via PayPal
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    UsePaypal(
                                      sandboxMode: true,
                                      clientId:
                                      "AZhLs7ccqc-uw96FzKixkYa6CtvMmDEjDZ9vOoqBIKUB-DR4mOnav4yWZ3fnnWbX_Nm_h76kdgEiBGgv",
                                      secretKey:
                                      "EHOOrdCqzsdksoIyxMaOMMRPgrjxqfJFsDXXhckNzGIkKjNvrGqjZiM2QmFxwaoCmHYnpYAxslcobxzB",
                                      returnURL: "https://samplesite.com/return",
                                      cancelURL: "https://samplesite.com/cancel",
                                      transactions: [
                                        {
                                          "amount": {
                                            "total": amountInUSD.toStringAsFixed(2),
                                            "currency": "USD",
                                            "details": {
                                              "subtotal": amountInUSD.toStringAsFixed(
                                                  2),
                                              "shipping": '0',
                                              "shipping_discount": 0
                                            }
                                          },
                                          "description": "Payment transaction description.",
                                          "item_list": {
                                            "items": [
                                              {
                                                "name": "A demo product",
                                                "quantity": 1,
                                                "price": amountInUSD.toStringAsFixed(2),
                                                "currency": "USD"
                                              }
                                            ],
                                          }
                                        }
                                      ],
                                      note: "Contact us for any questions on your order.",
                                      onSuccess: (Map params) async {
                                        print("onSuccess: $params");
                                        // Gérer le succès du paiement ici
                                      },
                                      onError: (error) {
                                        print("onError: $error");
                                        // Gérer les erreurs du paiement ici
                                      },
                                      onCancel: (params) {
                                        print('cancelled: $params');
                                        // Gérer l'annulation du paiement ici
                                      },
                                    ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            minimumSize: Size(120, 50),
                            primary: kPrimaryColor,
                          ),
                          child: Text('PAYER $enteredAmount FCFA '),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }


}


  InputDecorationTheme inputDecorationTheme() {
    OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(28),
      borderSide: BorderSide(color: kPrimaryColor, width: 1.0),
    );
    return InputDecorationTheme(
      filled: true,
      fillColor: Colors.grey[100],
      contentPadding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 7
      ),
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      //border: outlineInputBorder,
    );
  }


/*import 'package:flutter/material.dart';
import 'package:flutter_paypal/flutter_paypal.dart';


class PaymentScreen extends StatefulWidget {
  static String routeName= "/payment";


  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,MaterialPageRoute(
                    builder: ( context) => UsePaypal(
                        sandboxMode: true,
                        clientId:
                        "AZhLs7ccqc-uw96FzKixkYa6CtvMmDEjDZ9vOoqBIKUB-DR4mOnav4yWZ3fnnWbX_Nm_h76kdgEiBGgv",
                        secretKey:
                        "EHOOrdCqzsdksoIyxMaOMMRPgrjxqfJFsDXXhckNzGIkKjNvrGqjZiM2QmFxwaoCmHYnpYAxslcobxzB",
                        returnURL: "https://samplesite.com/return",
                        cancelURL: "https://samplesite.com/cancel",
                        transactions: const [
                          {
                            "amount": {
                              "total": '10.12',
                              "currency": "USD",
                              "details": {
                                "subtotal": '10.12',
                                "shipping": '0',
                                "shipping_discount": 0
                              }
                            },
                            "description":
                            "The payment transaction description.",
                            // "payment_options": {
                            //   "allowed_payment_method":
                            //       "INSTANT_FUNDING_SOURCE"
                            // },
                            "item_list": {
                              "items": [
                                {
                                  "name": "A demo product",
                                  "quantity": 1,
                                  "price": '10.12',
                                  "currency": "USD"
                                }
                              ],

                              // shipping address is not required though
                              /*"shipping_address": {
                                "recipient_name": "Jane Foster",
                                "line1": "Travis County",
                                "line2": "",
                                "city": "Austin",
                                "country_code": "US",
                                "postal_code": "73301",
                                "phone": "+00000000",
                                "state": "Texas"
                              },*/
                            }
                          }
                        ],
                        note: "Contact us for any questions on your order.",
                        onSuccess: (Map params) async {
                          print("onSuccess: $params");
                        },
                        onError: (error) {
                          print("onError: $error");
                        },
                        onCancel: (params) {
                          print('cancelled: $params');
                        }),
                  ),
                );
              },
              child: const Text("Make Payment")),
        ));
  }
}*/
