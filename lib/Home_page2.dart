import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:telescopium/Camera.dart';
import 'package:telescopium/patient_info.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telescopium/report.dart';

/*class LoginPage2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
        ShaderMask(shaderCallback: (bounds)=> LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.center,
          colors: [Colors.black,Colors.transparent],

        ).createShader(bounds),
          blendMode: BlendMode.darken ,
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/backlog.jpg"),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
                )
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Flexible(
                child: Center(
                  child: Text(
                    "Telescopium",
                    style: TextStyle(color: Colors.white,fontSize: 60, fontWeight: FontWeight.bold),
                  ),
                ),
              ),


              MaterialButton(onPressed: (){
                Navigator.push(context, new MaterialPageRoute(builder: (context)=>new CameraScreen()));
              },
                color: Colors.transparent,
                textColor: Colors.white,
                child: Icon(Icons.camera_alt_outlined,size: 40,
                ),
                padding: EdgeInsets.all(16),
                shape: CircleBorder(),
              ),
              /*Container(
                height: MediaQuery.of(context).size.height*.08,
                width: MediaQuery.of(context).size.width*.8,

                decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(16),
                  color: Color(0xff5663ff),
                ),
                child: FlatButton(
                  onPressed: (){
                    //make action
                  },
                  child: Text("Login",style:TextStyle(fontSize: 22,color: Colors.white,height: 1.5) ,),
                ),
              ),*/
            ],
          ),
        )
      ],
    );
  }
  }*/

/*
class CardDetail{
  String title ;
  String subtitle;
  Color color;
  CardDetail({this.title,this.subtitle,this.color});
}
class Dashboard extends StatefulWidget{
  @override
  _DashboardState createState()=>_DashboardState();
   bool a0,a1,a2;
double count;
  Dashboard({this.a0,this.a1,this.a2,this.count});

}

class _DashboardState extends State<Dashboard>
{
  double _percentage=0;
  @override
  void initState(){
    super.initState();
     //a0=true;
     //a1=true;
    // a2=true;
    //double _percentage=0;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
WidgetsBinding.instance.addPostFrameCallback((_) {

});


    _percentage=widget.count;

    return Scaffold(
      appBar: AppBar(title: Text('Home Page',),backgroundColor: Color.fromRGBO(64, 75, 96, .9),),
      body: Column(
        children: [
          Expanded(
            flex:3,
            child: //ListView.builder(
              //itemCount: cards.length,

              //itemBuilder: (context,index){
                Column(
                  children: <Widget>[
                    Card(

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(16),
                        ),
                      ),

                      color: widget.a0? Color(0xffC50C0C):Colors.green,
                      //color: Color.fromRGBO(64, 75, 96, .9),
                      elevation: 8.0,
                      margin: new EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 10.0,
                      ),
                      child: ListTile(
                        trailing: Icon(Icons.arrow_forward,color: Colors.white,),
                        onTap: (){Navigator.push(
                            context, MaterialPageRoute(builder: (context) => CameraScreen(0,_percentage)));
                        print(_percentage);
                        setState(() {
                           //a0=false;
                          //cards[index].color=Colors.deepOrange;
                        });

                        },
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 5.0,
                        ),
                        leading: Container(
                          padding: EdgeInsets.only(right: 12.0),
                          decoration: BoxDecoration(
                            border: Border(
                              right: BorderSide(
                                width: 1.0,
                                color: Colors.white24,
                              ),
                            ),
                          ),
                          child: Icon(Icons.play_circle_outline, color: Colors.white),
                        ),
                        title: Text(
                          'Right Eye',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Row(
                          children: [
                            //Icon(
                            //Icons.linear_scale,
                            //color: Colors.yellow,
                            //),
                            //SizedBox(
                            //width: 10,
                            //),
                            Text(
                              'Click and take photo to the right eye',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                        //trailing: Icon(
                        //Icons.keyboard_arrow_right,
                        //color: Colors.white,
                        //size: 30.0,
                        //),
                      ),
                    ),
                    Card(

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(16),
                        ),
                      ),
                      color: widget.a1?Color(0xffC50C0C):Colors.green,
                      elevation: 8.0,
                      margin: new EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 10.0,
                      ),
                      child: ListTile(
                        trailing: Icon(Icons.arrow_forward,color: Colors.white,),
                        onTap: (){Navigator.push(
                            context, MaterialPageRoute(builder: (context) => CameraScreen(1,_percentage)));
                        setState(() {

                          //a1=false;
                          //cards[index].color=Colors.deepOrange;
                        });

                        },
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 5.0,
                        ),
                        leading: Container(
                          padding: EdgeInsets.only(right: 12.0),
                          decoration: BoxDecoration(
                            border: Border(
                              right: BorderSide(
                                width: 1.0,
                                color: Colors.white24,
                              ),
                            ),
                          ),
                          child: Icon(Icons.play_circle_outline, color: Colors.white),
                        ),
                        title: Text(
                          'Left Eye',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Row(
                          children: [
                            //Icon(
                            //Icons.linear_scale,
                            //color: Colors.yellow,
                            //),
                            //SizedBox(
                            //width: 10,
                            //),
                            Text(
                              'Click and take photo to the Left eye',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                        //trailing: Icon(
                        //Icons.keyboard_arrow_right,
                        //color: Colors.white,
                        //size: 30.0,
                        //),
                      ),
                    ),
                    Card(

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(16),
                        ),
                      ),
                      color: widget.a2?Color(0xffC50C0C):Colors.green,
                      elevation: 8.0,
                      margin: new EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 10.0,
                      ),
                      child: ListTile(
                        trailing: Icon(Icons.arrow_forward,color: Colors.white,),
                        onTap: (){Navigator.push(
                            context, MaterialPageRoute(builder: (context) => Patient_Form(p: _percentage,)));
                        setState(() {
                          //a2=false;
                          //cards[index].color=Colors.deepOrange;
                        });

                        },
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 5.0,
                        ),
                        leading: Container(
                          padding: EdgeInsets.only(right: 12.0),
                          decoration: BoxDecoration(
                            border: Border(
                              right: BorderSide(
                                width: 1.0,
                                color: Colors.white24,
                              ),
                            ),
                          ),
                          child: Icon(Icons.play_circle_outline, color: Colors.white),
                        ),
                        title: Text(
                          'Patient info',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Row(
                          children: [
                            //Icon(
                            //Icons.linear_scale,
                            //color: Colors.yellow,
                            //),
                            //SizedBox(
                            //width: 10,
                            //),
                            Text(
                              'information about the patient',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                        //trailing: Icon(
                        //Icons.keyboard_arrow_right,
                        //color: Colors.white,
                        //size: 30.0,
                        //),
                      ),
                    ),
                  ],

                ),
              //}





              /*CardListTie(title: cards[index].title,subtitle: cards[index].subtitle,index: index,)*/ /*_CardListTileState(
                title:cards[index].title,
                subtitle:cards[index].subtitle,



              ),*/
            //),



          ),
          Expanded(
            flex: 1,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircularProgressIndicator(value: widget.count/100,backgroundColor: Colors.grey,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                    strokeWidth: 20,

                  ),
                ]
            )
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                RaisedButton(
                  child: Text("Submit"),
                  onPressed: (){

                  },
                )
              ],
            ),

          ),

        ],
      ),

    );
  }

}

class CardListTie extends StatefulWidget{
  final String title;
  final String subtitle;
  final int index;
  CardListTie({this.title,this.subtitle,this.index});
  @override
  _CardListTileState createState()=>_CardListTileState(title: title,subtitle: subtitle,index:index);
}
class _CardListTileState extends State<CardListTie> {
   String title;
   String subtitle;
   final int index;


  _CardListTileState({this.title, this.subtitle,this.index});
  @override
  void initState(){
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Container(
        //color: Colors.deepPurple,
        child:Card(

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      color: Color.fromRGBO(64, 75, 96, .9),
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 10.0,
      ),
      child: ListTile(
        trailing: Icon(Icons.arrow_forward,color: Colors.white,),
        onTap: (){//Navigator.push(
            //context, MaterialPageRoute(builder: (context) => CameraScreen(0,)));
        setState(() {
          //cards[index].color=Colors.deepOrange;
        });

        },
        contentPadding: EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 5.0,
        ),
        leading: Container(
          padding: EdgeInsets.only(right: 12.0),
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(
                width: 1.0,
                color: Colors.white24,
              ),
            ),
          ),
          child: Icon(Icons.play_circle_outline, color: Colors.white),
        ),
        title: Text(
          title,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        subtitle: Row(
          children: [
            //Icon(
              //Icons.linear_scale,
              //color: Colors.yellow,
            //),
            //SizedBox(
              //width: 10,
            //),
            Text(
              subtitle,
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
        //trailing: Icon(
          //Icons.keyboard_arrow_right,
          //color: Colors.white,
          //size: 30.0,
        //),
      ),
    ));
  }
}*/

import 'dart:developer';

import 'package:url_launcher/url_launcher.dart';



class CardDetail{
  String title ;
  String subtitle;
  Color color;
  CardDetail({this.title,this.subtitle,this.color});
}
class Dashboard extends StatefulWidget{
  @override
  _DashboardState createState()=>_DashboardState();
  static const PREFERENCES_IS_FIRST_LAUNCH_STRING = "PREFERENCES_IS_FIRST_LAUNCH_STRING";
  bool a0,a1,a2;
  bool show_case;
  double count;
  Dashboard({this.a0,this.a1,this.a2,this.count,this.show_case});

}

class _DashboardState extends State<Dashboard>
{

  double _percentage=0;
  GlobalKey _one = GlobalKey();
  GlobalKey _two = GlobalKey();
  GlobalKey _three = GlobalKey();
  GlobalKey _four = GlobalKey();
  GlobalKey _five = GlobalKey();

  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _isFirstLaunch().then((result){
        if(result||widget.show_case)
          ShowCaseWidget.of(context).startShowCase([_one, _two, _three, _four, _five]);
      });
        //ShowCaseWidget.of(context)
          //  .startShowCase([_one, _two, _three, _four, _five]);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build



    _percentage=widget.count;

    return Scaffold(
      appBar: AppBar(title: Text('Home Page',),backgroundColor: Color.fromRGBO(64, 75, 96, .9),),
      body: Column(
        children: [
          Expanded(
            flex:3,
            child: //ListView.builder(
            //itemCount: cards.length,

            //itemBuilder: (context,index){
            Column(
              children: <Widget>[
                Card(

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),

                  color: widget.a0? Color(0xffC50C0C):Colors.green,
                  //color: Color.fromRGBO(64, 75, 96, .9),
                  elevation: 8.0,
                  margin: new EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 10.0,
                  ),
                  child: ListTile(

                    trailing: Icon(Icons.arrow_forward,color: Colors.white,),
                    onTap: (){
                      Navigator.push(context, new MaterialPageRoute(
                        builder: (context)=>new Scaffold(
                          body: ShowCaseWidget(
                            onStart: (index, key) {
                              log('onStart: $index, $key');
                            },
                            onComplete: (index, key) {
                              log('onComplete: $index, $key');
                            },
                            builder: Builder(builder: (context) => CameraScreen(0,_percentage)),
                            autoPlay: false,
                            autoPlayDelay: Duration(seconds: 3),
                            autoPlayLockEnable: false,
                          ),
                        ),
                      ));
                      //Navigator.push(
                      //context, MaterialPageRoute(builder: (context) => CameraScreen(0,_percentage)));
                      print(_percentage);
                      setState(() {
                        //a0=false;
                        //cards[index].color=Colors.deepOrange;
                      });

                    },
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 5.0,
                    ),
                    leading: Container(
                      padding: EdgeInsets.only(right: 12.0),
                      decoration: BoxDecoration(
                        border: Border(
                          right: BorderSide(
                            width: 1.0,
                            color: Colors.white24,
                          ),
                        ),
                      ),
                      child:Showcase(
                        key: _one,
                        title: 'Right Eye',
                        description:
                        'Tap to catch Right Eye ',
                        contentPadding: EdgeInsets.all(8.0),
                        showcaseBackgroundColor: Colors.blueAccent,
                        textColor: Colors.white,
                        shapeBorder: RoundedRectangleBorder(),
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage('assets/download.jpeg'),
                            ),
                          ),
                        ),
                      ),
                      //Icon(Icons.play_circle_outline, color: Colors.white),
                    ),
                    title: Text(
                      'Right Eye',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Row(
                      children: [

                        //Icon(
                        //Icons.linear_scale,
                        //color: Colors.yellow,
                        //),
                        //SizedBox(
                        //width: 10,
                        //),

                        Text(
                          'Click and take photo to the\n right eye',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                    //trailing: Icon(
                    //Icons.keyboard_arrow_right,
                    //color: Colors.white,
                    //size: 30.0,
                    //),
                  ),
                ),
                Card(

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),
                  color: widget.a1?Color(0xffC50C0C):Colors.green,
                  elevation: 8.0,
                  margin: new EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 10.0,
                  ),
                  child: ListTile(
                    trailing: Icon(Icons.arrow_forward,color: Colors.white,),
                    onTap: (){
                      Navigator.push(context, new MaterialPageRoute(
                        builder: (context)=>new Scaffold(
                          body: ShowCaseWidget(
                            onStart: (index, key) {
                              log('onStart: $index, $key');
                            },
                            onComplete: (index, key) {
                              log('onComplete: $index, $key');
                            },
                            builder: Builder(builder: (context) => CameraScreen(1,_percentage)),
                            autoPlay: false,
                            autoPlayDelay: Duration(seconds: 3),
                            autoPlayLockEnable: false,
                          ),
                        ),
                      ));
                      //Navigator.push(
                        //context, MaterialPageRoute(builder: (context) => CameraScreen(1,_percentage)));
                    //setState(() {

                      //a1=false;
                      //cards[index].color=Colors.deepOrange;
                    //});

                    },
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 5.0,
                    ),
                    leading: Container(
                      padding: EdgeInsets.only(right: 12.0),
                      decoration: BoxDecoration(
                        border: Border(
                          right: BorderSide(
                            width: 1.0,
                            color: Colors.white24,
                          ),
                        ),
                      ),
                      child: Showcase(
                        key: _two,
                        title: 'Left Eye',
                        description:
                        'Tap to catch Left Eye ',
                        contentPadding: EdgeInsets.all(8.0),
                        showcaseBackgroundColor: Colors.blueAccent,
                        textColor: Colors.white,
                        shapeBorder: RoundedRectangleBorder(),
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage('assets/download.jpeg'),
                            ),
                          ),
                        ),
                      ),
                      //Icon(Icons.play_circle_outline, color: Colors.white),
                    ),
                    title: Text(
                      'Left Eye',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Row(
                      children: [
                        //Icon(
                        //Icons.linear_scale,
                        //color: Colors.yellow,
                        //),
                        //SizedBox(
                        //width: 10,
                        //),
                        Text(
                          'Click and take photo to the\n Left eye',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                    //trailing: Icon(
                    //Icons.keyboard_arrow_right,
                    //color: Colors.white,
                    //size: 30.0,
                    //),
                  ),
                ),
                Card(

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),
                  color: widget.a2?Color(0xffC50C0C):Colors.green,
                  elevation: 8.0,
                  margin: new EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 10.0,
                  ),
                  child: ListTile(
                    trailing: Icon(Icons.arrow_forward,color: Colors.white,),
                    onTap: (){
                      Navigator.push(context, new MaterialPageRoute(
                        builder: (context)=>new Scaffold(
                          body: ShowCaseWidget(
                            onStart: (index, key) {
                              log('onStart: $index, $key');
                            },
                            onComplete: (index, key) {
                              log('onComplete: $index, $key');
                            },
                            builder: Builder(builder: (context) => Patient_Form(p: _percentage,)),
                            autoPlay: false,
                            autoPlayDelay: Duration(seconds: 3),
                            autoPlayLockEnable: false,
                          ),
                        ),
                      ));
                      //Navigator.push(
                        //context, MaterialPageRoute(builder: (context) => Patient_Form(p: _percentage,)));
                    //setState(() {
                      //a2=false;
                      //cards[index].color=Colors.deepOrange;
                    //});

                    },
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 5.0,
                    ),
                    leading: Container(
                      padding: EdgeInsets.only(right: 12.0),
                      decoration: BoxDecoration(
                        border: Border(
                          right: BorderSide(
                            width: 1.0,
                            color: Colors.white24,
                          ),
                        ),
                      ),
                      child: Showcase(
                        key: _three,
                        title: 'Patient info',
                        description:
                        'Tap to fill Patient info ',
                        contentPadding: EdgeInsets.all(8.0),
                        showcaseBackgroundColor: Colors.blueAccent,
                        textColor: Colors.white,
                        shapeBorder: RoundedRectangleBorder(),
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage('assets/fill.png'),
                            ),
                          ),
                        ),
                      ),
                      //Icon(Icons.play_circle_outline, color: Colors.white),
                    ),
                    title: Text(
                      'Patient info',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Row(
                      children: [
                        //Icon(
                        //Icons.linear_scale,
                        //color: Colors.yellow,
                        //),
                        //SizedBox(
                        //width: 10,
                        //),
                        Text(
                          'information about the patient',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                    //trailing: Icon(
                    //Icons.keyboard_arrow_right,
                    //color: Colors.white,
                    //size: 30.0,
                    //),
                  ),
                ),
              ],

            ),
            //}





            /*CardListTie(title: cards[index].title,subtitle: cards[index].subtitle,index: index,)*/ /*_CardListTileState(
                title:cards[index].title,
                subtitle:cards[index].subtitle,



              ),*/
            //),



          ),
          Expanded(
              flex: 1,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircularProgressIndicator(value: widget.count/100,backgroundColor: Colors.grey,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                      strokeWidth: 20,

                    ),
                  ]
              )
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                RaisedButton(
                  child: Text("Submit"),
                  onPressed: (){
                    launchURL();
                    //Navigator.push(
                      //  context, MaterialPageRoute(builder: (context) => Report()));
                  },
                )
              ],
            ),

          ),
          Expanded(
          flex: 0,
            child:InkWell(
            onTap: () {
              _launchURL();
              //launchURL();
              /*Navigator.push(
                  context, MaterialPageRoute(builder: (context) => _launchURL()));
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => ShowCaseWidget(
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
              )));*/

            },
            child: Container(
              //margin: EdgeInsets.symmetric(vertical: 20),
              padding: EdgeInsets.all(2),
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Something wrong i want a',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Support',
                    style: TextStyle(
                        color: Color(0xffc50c0c),
                        fontSize: 13,
                        fontWeight: FontWeight.w600),
                  ),
                  /*SizedBox(
                    width: 10,
                  ),
                  Text(
                    'or',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    ' Help',
                    style: TextStyle(
                        color: Color(0xffc50c0c),
                        fontSize: 13,
                        fontWeight: FontWeight.w600),
                  ),*/
                ],
              ),
            ),
            ),
          ),
          Expanded(
            flex: 0,
            child:InkWell(
              onTap: () {

                //_launchURL;
               // Navigator.push(
                 //   context, MaterialPageRoute(builder: (context) => _launchURL()));
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => ShowCaseWidget(
                  onStart: (index, key) {
                    log('onStart: $index, $key');
                  },
                  onComplete: (index, key) {
                    log('onComplete: $index, $key');
                  },
                  builder: Builder(builder: (context) => Dashboard(a0: true,a1: true,a2: true,count: 0,show_case: true,)),
                  autoPlay: false,
                  autoPlayDelay: Duration(seconds: 3),
                  autoPlayLockEnable: false,
                )));//Dashboard(a0: true,a1: true,a2: true,count: 0,)));

              },
              child: Container(
                //margin: EdgeInsets.symmetric(vertical: 20),
                padding: EdgeInsets.all(2),
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    Text(
                      'or',
                      style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      '  Help',
                      style: TextStyle(
                          color: Color(0xffc50c0c),
                          fontSize: 13,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
          ),

        ],
      ),

    );
  }
  launchURL() {
    launch('https://www.mohamed-resume.tech/files/Medical%20Report.pdf');
  }

  _launchURL() async {
    const url = 'https://telescopium.azurewebsites.net/support/?fbclid=IwAR31rqF1XyoDG04DsRmEqY0D9pJ7MnGkTM4Mx9bKQKRa96um6hyUCEC-3eU'; //""
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  Future<bool> _isFirstLaunch() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    bool isFirstLaunch = sharedPreferences.getBool(
        Dashboard.PREFERENCES_IS_FIRST_LAUNCH_STRING) ?? true;

    if (isFirstLaunch)
      sharedPreferences.setBool(
          Dashboard.PREFERENCES_IS_FIRST_LAUNCH_STRING, false);

    return isFirstLaunch;
  }

}
// class support extends StatefulWidget{
//   _supportState createState()=> _supportState();
// }
// class _supportState extends State<support>{
//   /*void main() {
//     runApp(Scaffold(
//       body: Center(
//         child: RaisedButton(
//           onPressed: _launchURL,
//           //child: Text('Show Flutter homepage'),
//         ),
//       ),
//     ));
//   }*/
//   _launchURL() async {
//     const url = 'https://telescopium.azurewebsites.net/support/?fbclid=IwAR31rqF1XyoDG04DsRmEqY0D9pJ7MnGkTM4Mx9bKQKRa96um6hyUCEC-3eU'; //""
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     runApp(Scaffold(
//
//       body: Center(
//         child: RaisedButton(
//           onPressed: _launchURL,
//           //child: Text('Show Flutter homepage'),
//         ),
//       ),
//     ));
//   }
// }

class CardListTie extends StatefulWidget{
  final String title;
  final String subtitle;
  final int index;
  CardListTie({this.title,this.subtitle,this.index});
  @override
  _CardListTileState createState()=>_CardListTileState(title: title,subtitle: subtitle,index:index);
}
class _CardListTileState extends State<CardListTie> {
  String title;
  String subtitle;
  final int index;


  _CardListTileState({this.title, this.subtitle, this.index});

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.deepPurple,
        child: Card(

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          color: Color.fromRGBO(64, 75, 96, .9),
          elevation: 8.0,
          margin: new EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 10.0,
          ),
          child: ListTile(
            trailing: Icon(Icons.arrow_forward, color: Colors.white,),
            onTap: () { //Navigator.push(
              //context, MaterialPageRoute(builder: (context) => CameraScreen(0,)));
              setState(() {
                //cards[index].color=Colors.deepOrange;
              });
            },
            contentPadding: EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 5.0,
            ),
            leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(
                    width: 1.0,
                    color: Colors.white24,
                  ),
                ),
              ),
              child: Icon(Icons.play_circle_outline, color: Colors.white),
            ),
            title: Text(
              title,
              style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            subtitle: Row(
              children: [
                //Icon(
                //Icons.linear_scale,
                //color: Colors.yellow,
                //),
                //SizedBox(
                //width: 10,
                //),
                Text(
                  subtitle,
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
            //trailing: Icon(
            //Icons.keyboard_arrow_right,
            //color: Colors.white,
            //size: 30.0,
            //),
          ),
        ));
  }
}


