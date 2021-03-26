
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:showcaseview/showcase_widget.dart';
import 'package:telescopium/Home_page2.dart';
class Patient_Form extends StatefulWidget{
  double p;
  Patient_Form({this.p});
  @override
  _Patient_FormState createState()=> _Patient_FormState();
}

class _Patient_FormState extends State<Patient_Form> {
  List _countrycodes = ["Afghanistan","Aland Islands","Albania","Algeria","American Samoa","Andorra","Angola","Anguilla","Antarctica","Antigua and Barbuda"
  ,"Argentina","Armenia","Aruba","Australia","Austria","Azerbaijan","Bahamas","Bahrain","Bangladesh","Barbados","Belarus","Belgium",
  "Belize","Benin","Bermuda","Bhutan","Bolivia","Bonaire, Sint Eustatius and Saba","Bosnia and Herzegovina","Botswana","Bouvet Island",
  "Brazil","British Indian Ocean Territory","Brunei Darussalam","Bulgaria","Burkina Faso","Burundi","Cambodia","Cameroon","Canada",
  "Cape Verde","Cayman Islands","Central African Republic","Chad","Chile","China","Christmas Island","Cocos (Keeling) Islands",
  "Colombia","Comoros","Congo","Congo, the Democratic Republic of the","Cook Islands","Costa Rica","Cote D'Ivoire","Croatia",
  "Cuba","Curacao","Cyprus","Czech Republic","Denmark","Djibouti","Dominica","Dominican Republic","Ecuador","Egypt","El Salvador",
  "Equatorial Guinea","Eritrea","Estonia","Ethiopia","Falkland Islands (Malvinas)","Faroe Islands","Fiji","Finland","France","French Guiana",
  "French Polynesia","French Southern Territories","Gabon","Gambia","Georgia","Germany","Ghana","Gibraltar","Greece","Greenland",
  "Grenada","Guadeloupe","Guam","Guatemala","Guernsey","Guinea","Guinea-Bissau","Guyana","Haiti","Heard Island and Mcdonald Islands","Holy See (Vatican City State)",
  "Honduras","Hong Kong","Hungary","Iceland","India","Indonesia","Iran","Iraq","Ireland","Isle of Man","Israel","Italy","Jamaica",
  "Japan","Jersey","Jordan","Kazakhstan","Kenya","Kiribati","Korea","Kosovo","Kuwait","Kyrgyzstan","Lao People's Democratic Republic",
  "Latvia","Lebanon","Lesotho","Liberia","Libyan Arab Jamahiriya","Liechtenstein","Lithuania","Luxembourg","Macao","Macedonia",
  "Madagascar","Malawi","Malaysia","Maldives","Mali","Malta","Marshall Islands","Martinique","Mauritania","Mauritius","Mayotte","Mexico",
  "Micronesia","Moldova","Monaco","Mongolia","Montenegro","Montserrat","Morocco","Mozambique","Myanmar","Namibia","Nauru","Nepal",
  "Netherlands","Netherlands Antilles","New Caledonia","New Zealand","Nicaragua","Niger","Nigeria","Niue","Norfolk Island","Northern Mariana Islands",
  "Norway","Oman","Pakistan","Palau","Palestinian Territory, Occupied","Panama","Papua New Guinea","Paraguay","Peru","Philippines",
  "Pitcairn","Poland","Portugal","Puerto Rico","Qatar","Reunion","Romania","Russian Federation","Rwanda","Saint Barthelemy","Saint Helena",
  "Saint Kitts and Nevis","Saint Lucia","Saint Martin","Saint Pierre and Miquelon","Saint Vincent and the Grenadines","Samoa","San Marino",
  "Sao Tome and Principe","Saudi Arabia","Senegal","Serbia","Serbia and Montenegro","Seychelles","Sierra Leone","Singapore","Sint Maarten",
  "Slovakia","Slovenia","Solomon Islands","Somalia","South Africa","South Georgia and the South Sandwich Islands","South Sudan","Spain",
  "Sri Lanka","Sudan","Suriname","Svalbard and Jan Mayen","Swaziland","Sweden","Switzerland","Syrian Arab Republic","Taiwan, Province of China",
  "Tajikistan","Tanzania, United Republic of","Thailand","Timor-Leste","Togo","Tokelau","Tonga","Trinidad and Tobago","Tunisia","Turkey",
  "Turkmenistan","Turks and Caicos Islands","Tuvalu","Uganda","Ukraine","United Arab Emirates","United Kingdom","United States","United States Minor Outlying Islands",
  "Uruguay","Uzbekistan","Vanuatu","Venezuela","Viet Nam","Virgin Islands, British","Virgin Islands, U.s.","Wallis and Futuna","Western Sahara","Yemen",
  "Zambia","Zimbabwe"];
  List _Gender=["Male","Female"];
  List<DropdownMenuItem<String>> _dropDownMenuItems;
  List<DropdownMenuItem<String>> _dropdownMenuItems;
  String _selectedCountryCode;
  String _selectedGender;

  @override
  void initState() {
    _dropDownMenuItems = buildDropdownMenuItems(_Gender);
    _dropdownMenuItems = buildDropdownMenuItems(_countrycodes);
    //_selectedGender = _dropDownMenuItems[0].value;
    super.initState();
  }
  List<DropdownMenuItem<String>> buildDropdownMenuItems(List companies) {
    List<DropdownMenuItem<String>> items = List();
    for (String company in companies) {
      items.add(
        DropdownMenuItem(
          value: company,
          child: Text(company),
        ),
      );
    }
    return items;
  }

  onChangeDropdownItem(String selectedCompany) {
    setState(() {
      _selectedCountryCode = selectedCompany;
    });
  }

  List<DropdownMenuItem<String>> buildDropDownMenuItems(List companies) {
    List<DropdownMenuItem<String>> items = List();
    for (String company in companies) {
      items.add(
        DropdownMenuItem(
          value: company,
          child: Text(company),
        ),
      );
    }
    return items;
  }

  onChangeDropDownItem(String selectedCompany) {
    setState(() {
      _selectedGender = selectedCompany;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final height = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
        body: Container(

          height: height,
          child: Stack(

            children: <Widget>[
              Positioned(

                  top: -height * .15,
                  right: -MediaQuery
                      .of(context)
                      .size
                      .width * .4,
                  child: BezierContainer()),
              Container(

                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: height * .1), //0.2
                      Image.asset("assets/tele.png", width: 300, height: 300 ,),
                      SizedBox(height: 0), //50
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 0,horizontal: 0),
                       // child: Divider(),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0,horizontal: 16.0),
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'Name',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(16),),

                            ),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0,horizontal: 16.0),
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'Age',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(16),),

                            ),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0,horizontal: 16.0),
                        child: DropdownButton(
                           hint: Text("Gender"),
                          value: _selectedGender ,
                          items: _dropDownMenuItems,
                          //items:_Gender.map((code) => new DropdownMenuItem(value: code,child: Text(code),)).toList(),
                          isExpanded: true,
                          onChanged: onChangeDropDownItem,
                          //onChanged: ( newValue){setState(() {
                            //_selectedGender=newValue;
                          //});},


                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0,horizontal: 16.0),
                        child: DropdownButton(
                          hint: Text("Region"),
                          value: _selectedCountryCode ,
                          isExpanded: true,
                          onChanged: onChangeDropdownItem,

                          items: _dropdownMenuItems

                        ),
                      ),

                      _submitButton(),
                      /*_emailPasswordWidget(),
                      SizedBox(height: 20),

                      SizedBox(height: 20),
                      _submitButton(),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        alignment: Alignment.centerRight,


                      ),*/

                    ],
                  ),
                ),
              ),
              //Positioned(top: 40, left: 0, child: _backButton()),
            ],
          ),
        ));
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        _entryField("name"),
        _entryField("Age"),
        _entryField("Single or Maried"),
        _entryField("man or women"),
        _entryField("Area"),
        _entryField("so"),
        _entryField("soso"),
        _entryField("sosososo"),
      ],
    );
  }

  Widget _submitButton() {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width,
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
              //colors: [Color(0xff0000ff),Color(0xff191970)],
              colors: [Color(0xffC50C0C), Color(0xffD54C4C)]
    )),
      child:FlatButton(
        onPressed: (){
          Navigator.push(context, new MaterialPageRoute(
            builder: (context)=>new Scaffold(
              body: ShowCaseWidget(
                onStart: (index, key) {
                  log('onStart: $index, $key');
                },
                onComplete: (index, key) {
                  log('onComplete: $index, $key');
                },
                builder: Builder(builder: (context) => new Dashboard(a0: false,a1: false,a2: false,count: (100/3)+widget.p,)),
                autoPlay: false,
                autoPlayDelay: Duration(seconds: 3),
                autoPlayLockEnable: false,
              ),
            ),
          ));
          //Navigator.push(context, new MaterialPageRoute(builder: (context)=>new Dashboard(a0: false,a1: false,a2: false,count: (100/3)+widget.p,)));
        },
      child: Text(
        'Next',
        style: TextStyle(fontSize: 20, color: Colors.white),
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
                    //colors: [Color(0xff0000ff),Color(0xff191970)]
                  )
              ),
            ),
          ),
        )
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
