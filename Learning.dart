
import 'package:crypto_buddy/packages/layoutHome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';


class Learning extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navigation Bar',
      theme: ThemeData(
          primarySwatch: Colors.grey,
          canvasColor: Colors.grey[200],
          accentColor: Colors.grey[400]),
      home: MyLearning(),
    );
  }
}

class MyLearning extends StatefulWidget{
  @override
  _MyLearningState createState() => _MyLearningState();
}

class _MyLearningState extends State<MyLearning> {
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

          title: Text('Learning',style:TextStyle(color:Colors.white)),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: pageController,
          children: [
            Container(
              alignment: Alignment.center,
              child: Icon(
                Icons.live_tv,
                size: 56,
                color: Colors.amber[400],
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Icon(
                Icons.recommend_sharp,
                size: 56,
                color: Colors.red[400],
              ),
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
              filledIcon: Icons.live_tv_rounded,
              outlinedIcon: Icons.live_tv_outlined,
            ),
            BarItem(
              filledIcon: Icons.recommend_rounded,
              outlinedIcon: Icons.recommend_outlined,
            ),
          ],
        ),
      ),
    );
  }
}