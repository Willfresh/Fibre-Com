import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'category.dart';
import 'header.dart';
class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
            child: Column(
              children: [
                Header(),
                Category(),
              ],
            ),
          );
  }
}

