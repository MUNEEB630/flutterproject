import 'package:crypto_buddy/packages/sidebar.dart';
import 'package:flutter/material.dart';

import 'HomePage.dart';
import 'Learning.dart';




class LayoutHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          HomePage(),
          SideBar(),
        ]
      ),

    );


  }
}

