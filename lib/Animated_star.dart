import 'dart:async';
import 'dart:ui';
import 'package:telescopium/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:telescopium/Home_page.dart';
import 'package:telescopium/animated_screen.dart';

class Animatedstar extends StatefulWidget {

  @override
  _AnimatedstarState createState()=>_AnimatedstarState();
}

class _AnimatedstarState extends State<Animatedstar> with SingleTickerProviderStateMixin {
  var _visible = true;
  AnimationController animationController;
  Animation<double> animation;

  startTime() async {
    var _duration = new Duration(seconds: 4);
    //Timer(_duration, navigationPage);
    return  Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.push(context, new MaterialPageRoute(builder: (context)=>new LoginPage()));

  }

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: Duration(seconds: 4), vsync: this);
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.fastLinearToSlowEaseIn);
    animation.addListener(() => this.setState(() {}));
    animationController.forward();
    setState(() {
      _visible = !_visible;
    });
    startTime();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      body: Stack(

        fit: StackFit.expand,
        children: <Widget>[
          new Container(

          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(padding: EdgeInsets.only(bottom: 30.0),
                child: Text("Telescopium",style:TextStyle(fontSize: 25,fontWeight: FontWeight.bold,)  ,),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/tele.png', width: animation.value * 300,
                height: animation.value * 300,)
            ],
          )
        ],
      ),
    );
  }


}


