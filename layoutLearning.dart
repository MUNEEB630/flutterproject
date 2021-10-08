import 'package:crypto_buddy/packages/sidebar.dart';
import 'package:flutter/material.dart';

import 'HomePage.dart';
import 'Learning.dart';




class LayoutLearning extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children: <Widget>[
            Learning(),
            SideBar(),
          ]
      ),

    );


  }
}