
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:telescopium/Home_page.dart';
import 'package:telescopium/Home_page2.dart';

import 'package:showcaseview/showcaseview.dart';

class Homepage extends StatefulWidget{

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>{


  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new Scaffold(

        backgroundColor: Colors.pink,
        body: new Stack(
          fit: StackFit.expand,
          children: <Widget>[
            new Column(
              children: <Widget>[
                SizedBox(height: 70.0),
                SizedBox(
                  height: 0.0,
                  child: new Text(
                    "Home Page",
                    style: TextStyle(
                        color: Colors.pink,
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new RaisedButton(
                    elevation: 0.0,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    padding: EdgeInsets.only(
                        top: 7.0, bottom: 7.0, right: 40.0, left: 7.0),
                    onPressed: () {
                      Navigator.push(context, new MaterialPageRoute(builder: (context)=>new Scaffold(
                        body: ShowCaseWidget(
                          onStart: (index, key) {
                            log('onStart: $index, $key');
                          },
                          onComplete: (index, key) {
                            log('onComplete: $index, $key');
                          },
                          builder: Builder(builder: (context) => Dashboard(a0: true,a1: true,a2: true,count: 0,)),
                          autoPlay: false,
                          autoPlayDelay: Duration(seconds: 3),
                          autoPlayLockEnable: false,
                        ),
                      ),
                      )
                      );
                      //Navigator.push(context, new MaterialPageRoute(builder: (context)=>new DashBoard(a0: true,a1: true,a2: true,count: 20,)));
                      //Navigator.of(context).pushReplacementNamed(CameraScreen());
                    },
                    child: new Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[

                        Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: new Text(
                              "Video Splash   ",
                              style: TextStyle(
                                  fontSize: 15.0, fontWeight: FontWeight.bold),
                            ))
                      ],
                    ),
                    textColor: Color(0xFF292929),
                    color: Color(0xFFDADADA)),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 0.0, right: 0.0, top: 30.0, bottom: 0.0),
                  child: new RaisedButton(
                      elevation: 0.0,
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                      padding: EdgeInsets.only(
                          top: 7.0, bottom: 7.0, right: 40.0, left: 7.0),/*Camera(imageMask:ClipOval(child: new Camera(),clipper: MyClipper())CameraFocus.circle(color: Colors.black.withOpacity(0.6)*/
                      onPressed: () {
                        Navigator.push(context, new MaterialPageRoute(builder: (context)=> new LoginPage() /*Camera(imageMask:CameraFocus.circle(color: Colors.black.withOpacity(0.6))*/));
                       // Navigator.push(context, new MaterialPageRoute(builder: (context)=>new Camera(orientationEnablePhoto: CameraOrientation.all,imageMask: ClipOval(

                         // clipper:MyClipper() ,

                        //) ),));
                      },
                      child: new Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          //new Image.asset('assets/images/image.png',
                            //  height: 40.0, width: 40.0),
                          Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: new Text(
                                "Image Splash   ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0),
                              ))
                        ],
                      ),
                      textColor: Color(0xFF292929),
                      color: Color(0xFFDADADA)),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 0.0, right: 0.0, top: 30.0, bottom: 0.0),
                  child: new RaisedButton(
                      elevation: 0.0,
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                      padding: EdgeInsets.only(
                          top: 7.0, bottom: 7.0, right: 25.0, left: 7.0),
                      onPressed: () async {
                        Navigator.push(context, new MaterialPageRoute(builder: (context)=>new Dashboard(a0: true,a1: true,a2: true,count: 0,)));
                      },
                      child: new Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[

                          Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: new Text(
                                "Animated Splash",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0),
                              ))
                        ],
                      ),
                      textColor: Color(0xFF292929),
                      color: Color(0xFFDADADA)),
                )
              ],
            )
          ],
        ));
  }
}
class MyClipper extends CustomClipper<Rect>{
  Rect getClip(Size size){
    return Rect.fromLTWH(150, 250, 100, 200);
  }
  bool shouldReclip(oldClipper){
    return false;
  }
}



