
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:showcaseview/showcase_widget.dart';
import 'package:telescopium/animated_screen.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Home_page2.dart';
/*
class Home_page extends StatefulWidget{
  @override
  _Home_pageState createState() =>Home_pageState();
}
class Home_pageState extends State<Home_page>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

    );
  }

}*/
class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            Text('Back',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }

  Widget _entryField(String title, {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
              obscureText: isPassword,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
        ],
      ),
    );
  }

  Widget _submitButton() {
    return InkWell(
      onTap: () {
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
        //Navigator.push(
          //  context, MaterialPageRoute(builder: (context) => Homepage()));
      },
        child:Container(

      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 15),
      alignment: Alignment.center,
      decoration: BoxDecoration(

          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.shade200,
                offset: Offset(2, 4),
                blurRadius: 5,
                spreadRadius: 2)
          ],
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xffC50C0C), Color(0xffD54C4C)])),
      child: Text(
        'Login',
        style: TextStyle(fontSize: 20, color: Colors.white),
      )
        ),
    );
  }

  Widget _divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),

          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }

  /*Widget _facebookButton() {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xff1959a9),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    topLeft: Radius.circular(5)),
              ),
              alignment: Alignment.center,
              child: Text('f',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w400)),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xff2872ba),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(5),
                    topRight: Radius.circular(5)),
              ),
              alignment: Alignment.center,
              child: Text('Log in with Facebook',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w400)),
            ),
          ),
        ],
      ),
    );
  }
*/
  Widget _createAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Homepage()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Don\'t have an account ?',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Register',
              style: TextStyle(
                  color: Color(0xffc50c0c),
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
/*
  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,

      text: TextSpan(
          text: 'T',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Color(0xffe46b10),
          ),
          children: [
            TextSpan(
              text: 'ele',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
            TextSpan(
              text: 'scopium',
              style: TextStyle(color: Color(0xffe46b10), fontSize: 30),
            ),
          ]),
    );
  }*/

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        _entryField("Email id"),
        _entryField("Password", isPassword: true),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(

          height: height,
          child: Stack(

            children: <Widget>[
              Positioned(

                  top: -height * .15,
                  right: -MediaQuery.of(context).size.width * .4,
                  child: BezierContainer()),
              Container(

                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      //Image.asset("assets/ani.png",width:20 ,height: 100,),
                      SizedBox(height: height * .1),//0.2
                      //_title(),
                      Image.asset("assets/tele.png",width:300 ,height: 300,),
                      SizedBox(height: 0),//50
                      _emailPasswordWidget(),
                      SizedBox(height: 20),
                      _submitButton(),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        alignment: Alignment.centerRight,

                        child: Text('Forgot Password ?',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500)),
                      ),
                     // _divider(),
                      //_facebookButton(),
                      //SizedBox(height: height * .055),
                      _createAccountLabel(),
                    ],
                  ),
                ),
              ),
              Positioned(top: 40, left: 0, child: _backButton()),
            ],
          ),
        ));
  }
}

class BezierContainer extends StatelessWidget {
  const BezierContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Transform.rotate(
          angle: -3.14 / 3.5,
          child: ClipPath(
            clipper: ClipPainter(),
            child: Container(
              height: MediaQuery.of(context).size.height *.5,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xffC50C0C),Color(0xffD54C4C)]
                    //colors: [Color(0xfffbb448),Color(0xffe46b10)]
                  )
              ),
            ),
          ),
        )
    );
  }
}
class ClipPainter extends CustomClipper<Path>{
  @override

  Path getClip(Size size) {
    var height = size.height;
    var width = size.width;
    var path = new Path();

    path.lineTo(0, size.height );
    path.lineTo(size.width , height);
    path.lineTo(size.width , 0);

    /// [Top Left corner]
    var secondControlPoint =  Offset(0  ,0);
    var secondEndPoint = Offset(width * .2  , height *.3);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);



    /// [Left Middle]
    var fifthControlPoint =  Offset(width * .3  ,height * .5);
    var fiftEndPoint = Offset(  width * .23, height *.6);
    path.quadraticBezierTo(fifthControlPoint.dx, fifthControlPoint.dy, fiftEndPoint.dx, fiftEndPoint.dy);


    /// [Bottom Left corner]
    var thirdControlPoint =  Offset(0  ,height);
    var thirdEndPoint = Offset(width , height  );
    path.quadraticBezierTo(thirdControlPoint.dx, thirdControlPoint.dy, thirdEndPoint.dx, thirdEndPoint.dy);



    path.lineTo(0, size.height  );
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }


}
/*
class LoginPage extends StatelessWidget{
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical:10.0),
                child: Container(
                  height: MediaQuery.of(context).size.height*.08,
                  width: MediaQuery.of(context).size.width*.8,
                  decoration: BoxDecoration(
                    color: Colors.grey[200].withOpacity(0.4),
                    borderRadius: BorderRadius.circular(16)
                  ),
                  child: Center(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Icon(
                            Icons.email_outlined,
                            size: 28,
                            color: Colors.white,
                          ),

                        ),
                        hintText: "Email",
                        hintStyle: TextStyle(fontSize: 22,color: Colors.white,height: 1.5),
                      ),
                      style: TextStyle(fontSize: 22,color: Colors.white,height: 1.5),
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical:10.0),
                child: Container(
                  height: MediaQuery.of(context).size.height*.08,
                  width: MediaQuery.of(context).size.width*.8,
                  decoration: BoxDecoration(
                      color: Colors.grey[200].withOpacity(0.4),
                      borderRadius: BorderRadius.circular(16)
                  ),
                  child: Center(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Icon(
                            Icons.lock,
                            size: 28,
                            color: Colors.white,
                          ),

                        ),
                        hintText: "Password",
                        hintStyle: TextStyle(fontSize: 22,color: Colors.white,height: 1.5),
                      ),
                      obscureText: true,
                      style: TextStyle(fontSize: 22,color: Colors.white,height: 1.5),
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.done,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25,),
              Container(
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
              ),
            ],
          ),
        )
      ],
    );
  }


}*/