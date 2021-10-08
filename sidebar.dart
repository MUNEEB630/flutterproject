import 'dart:async';
import 'dart:core';
import 'package:crypto_buddy/packages/layoutHome.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:store_redirect/store_redirect.dart';

import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:crypto_buddy/packages/layoutLearning.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';

class SideBar extends StatefulWidget {
  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> with SingleTickerProviderStateMixin<SideBar>{
  final _dialog = RatingDialog(
    // your app's name?
    title: 'Rate Us On App Store',
    // encourage your user to leave a high rating?
    message:
    'Select Number of Stars 1 - 5 to Rate This App',
    // your app's logo?
    image: SizedBox(height:100,
      child: Image.asset("assets/b4.png",fit: BoxFit.cover
        ),
    ),
    submitButton: 'Submit',
    // ignore: avoid_print
    onCancelled: () => print('cancelled'),
    // ignore: avoid_print
    onSubmitted: (response) {
      // ignore: avoid_print
      print('rating: ${response.rating}, comment: ${response.comment}');
      // ignore: todo
      // TODO: add your own logic
      if (response.rating < 3.0) {
        // send their comments to your email or anywhere you wish
        // ask the user to contact you instead of leaving a bad review
      } else {
        //go to app store
        StoreRedirect.redirect(androidAppId: 'shri.complete.fitness.gymtrainingapp',iOSAppId: 'com.example.rating');
      }
    },
  );
    void dialog(){
      showPlatformDialog(
        context: context,
        builder: (_) => BasicDialogAlert(
          title: Center(child: Text("Version (v1.0)")),
          content: Container(
            height: 270,

            child: ListView(
              children: <Widget> [


                const SizedBox(height: 5),
                Center(
                  child: Container(
                    child: Text("Designed and developed by",style:TextStyle(fontSize: 12,fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(height: 15),
                Container(child:new Image.asset(
                  'assets/b3.png',
                  width: 150.0,
                  height: 150.0,
                  fit: BoxFit.cover,
                ),),

                const SizedBox(height:5),
                Center(
                  child: Container(
                    child: Text("XTenMark",style:TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(height: 4),
                Center(
                  child: Container(
                    child: Text("please write us on",style:TextStyle(fontSize: 14,)),
                  ),
                ),
                const SizedBox(height: 1),
                Center(
                  child: Container(
                    child: Text("xtenmarkqueries@gmail.com",style:TextStyle(fontSize: 14)),
                  ),
                ),
              ]
            ),
          ),
          actions: <Widget>[
            BasicDialogAction(
              title: Text("Ok",style:TextStyle(fontSize:20)),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    }


  late AnimationController _animationController;
  late StreamController<bool> isSidebarOpenedStreamController;
  late Stream<bool> isSidebarOpenedStream;
  late StreamSink<bool> isSidebarOpenedSink;
  final _animationDuration = const Duration(milliseconds: 500);
  void funcOpenMailComposer() async{
  launch("mailto:xtenmarkqueries@gmail.com?Subject=Queries | Bugs&body=Thanks for writing feedback it will help us make the app better!.");
  }
  @override
    void initState(){
    super.initState();
    _animationController = AnimationController(vsync: this ,duration : _animationDuration);
    isSidebarOpenedStreamController = PublishSubject<bool>();
    isSidebarOpenedStream = isSidebarOpenedStreamController.stream;
    isSidebarOpenedSink = isSidebarOpenedStreamController.sink;
  }
  @override
  void dispose(){
    _animationController.dispose();
    isSidebarOpenedStreamController.close();
    isSidebarOpenedSink.close();
    super.dispose();
  }
  void onIconPressed(){
    final animationStatus = _animationController.status;
    final isAnimationCompleted = animationStatus == AnimationStatus.completed;
    if (isAnimationCompleted){
      isSidebarOpenedSink.add(false);
     _animationController.reverse();
    }else{
      isSidebarOpenedSink.add(true);
      _animationController.forward();
    }
  }
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return StreamBuilder<bool>(
      initialData: false,
      stream:isSidebarOpenedStream,
      builder:(context,isSideBarOpenedAsync){
        return AnimatedPositioned(
          duration: _animationDuration,
          top:0,
          bottom:0,
          left: isSideBarOpenedAsync.data! ? 0 : -screenWidth,
          right: isSideBarOpenedAsync.data! ? 0 : screenWidth - 45,
          child: Row(
            children: <Widget>[
              Expanded(
                  child: Container(
                    color: Colors.grey[900],
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                  color: Colors.grey[900],
                child:  Column(
                  children: [SizedBox(
                    height: 100,
                  ),
                    ListTile(
                      title: Text(
                        "Crypto Buddy",
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),

                      leading: CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage('assets/b2.png'),
                        radius: 40,
                      ),
                    ),
                    Divider(
                      height: 64,
                      thickness: 0.5,
                      color: Colors.white.withOpacity(0.3),
                      indent: 32,
                      endIndent: 32,
                    ),

                    const SizedBox(height: 15),
                    buildMenuItem(
                      text: 'Home',
                      icon: Icons.people,
                      onClicked: () => selectedItem(context, 0),
                    ),
                    const SizedBox(height: 15),
                    buildMenuItem(

                      text: 'Learning',
                      icon: Icons.airplay_rounded,
                      onClicked: () => selectedItem(context, 1),
                    ),
                    Divider(
                      height: 64,
                      thickness: 0.5,
                      color: Colors.white.withOpacity(0.3),
                      indent: 32,
                      endIndent: 32,
                    ),
                    const SizedBox(height: 16),
                    buildMenuItem(
                      text: 'App Mode',
                      icon: Icons.wb_sunny_outlined,

                    ),
                    const SizedBox(height: 16),
                buildMenuItem(

                  text: 'Feedback',
                  icon: Icons.feedback,
                    onClicked: () {
                      funcOpenMailComposer();
                    }

                ),



                    const SizedBox(height: 16),
                    buildMenuItem(
                      text: 'About us',
                      icon: Icons.api,
                        onClicked: () {
                          dialog();
                        }

                    ),
                    const SizedBox(height: 16),
                    buildMenuItem(
                        text: 'Rate us',
                        icon: Icons.rate_review_outlined,
                        onClicked: () {
        showDialog(
        context: context,
        builder: (context) => _dialog,
        );
        }

                    ),



                  ],
                ),
              ),
              ))
        ,
              Align(
                alignment: Alignment(0,-0.9),
                child: GestureDetector(
                  onTap: (){
                    onIconPressed();
                  },

                  child: ClipPath(
                    clipper:CustomMenuClipper(),
                    child: Container(
                        width:35,
                        height:100,
                        color: Colors.grey[900],
                        alignment: Alignment.centerLeft,
                        child: AnimatedIcon(
                          progress: _animationController.view,
                          icon: AnimatedIcons.menu_close,
                          color:Colors.white,
                          size:25,
                        )

                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },

    );
  }
}

class CustomMenuClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Paint paint = Paint();
    paint.color = Colors.white;

    final width = size.width;
    final height = size.height;

    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(0, 8, 10, 16);
    path.quadraticBezierTo(width - 1, height / 2 - 20, width, height / 2);
    path.quadraticBezierTo(width + 1, height / 2 + 20, 10, height - 16);
    path.quadraticBezierTo(0, height - 8, 0, height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
Widget buildMenuItem({
  required String text,
  required IconData icon,
  VoidCallback? onClicked,
}) {
  final color = Colors.white;
  final hoverColor = Colors.grey;

  return ListTile(
    leading: Icon(icon, color: color),
    title: Text(text, style: TextStyle(color: color,fontSize: 19)),
    hoverColor: hoverColor,
    onTap: onClicked,
  );
}
void selectedItem(BuildContext context, int index) {
  Navigator.of(context).pop();

  switch (index) {
    case 0:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => LayoutHome(),
      ));
      break;
    case 1:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => LayoutLearning(),
      ));
      break;
  }
}

