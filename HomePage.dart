
import 'package:crypto_buddy/packages/sidebar.dart';
import 'package:crypto_buddy/packages/layoutHome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';


class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Navigation Bar',
      theme: ThemeData(
          primarySwatch: Colors.grey,
          canvasColor: Colors.grey[200],
          accentColor: Colors.grey[400]),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;
  late PageController pageController;
  @override
  void initState() {

    super.initState();

    pageController = PageController(initialPage: selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    /// [AnnotatedRegion<SystemUiOverlayStyle>] is only for android

    return AnnotatedRegion<SystemUiOverlayStyle>(
      // ignore: prefer_const_constructors
      value: SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.black,
          systemNavigationBarIconBrightness: Brightness.dark),
      child: Scaffold(



        appBar: AppBar(
          title: Text('Home',style:TextStyle(color:Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),

        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: pageController,
          children: [
            Container(
              alignment: Alignment.center,
                child: Text("PAGE 1")
            ),
            Container(
              alignment: Alignment.center,
                child: Text("PAGE 2")
            ),
            Container(
              alignment: Alignment.center,
              child: Text("PAGE 3")
            ),
          ],
        ),
        bottomNavigationBar: WaterDropNavBar(
          // bottomPadding: 8.0, for android maybe, test by yourself what is suitable
          backgroundColor: Colors.black,
          waterDropColor: Colors.white,
          onItemSelected: (index) {
            setState(() {
              selectedIndex = index;
            });
            pageController.animateToPage(selectedIndex,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeOutQuad);
          },
          selectedIndex: selectedIndex,
          barItems: [
            BarItem(
              filledIcon: Icons.home_rounded,
              outlinedIcon: Icons.home_outlined,
            ),
            BarItem(
                filledIcon: Icons.feed_rounded,
                outlinedIcon: Icons.feed_outlined
            ),
            BarItem(
              filledIcon: Icons.book_rounded,
              outlinedIcon: Icons.book_outlined,
            ),
          ],
        ),
      ),
    );
  }
}