/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShapePainter extends CustomPainter{
  @ override
  void paint(Canvas canvas, Size size){
    var paint=Paint()

        ..color=Colors.pinkAccent
        ..strokeWidth=5
        ..style=PaintingStyle.stroke
        ..strokeCap=StrokeCap.round;
    Offset center = Offset(size.width/2,size.height/2);
    print(center);
    canvas.drawOval(Rect.fromLTRB(size.width/2,size.height/2,150,200.0), paint);
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate)
  {
    return false;
  }
}*/

/*
import 'package:flutter/material.dart';
import 'package:food_delivery/bloc/listTileColorBloc.dart';
import 'package:food_delivery/widgets/category_list_item_widget.dart';
import 'package:food_delivery/widgets/items_widget.dart';
import 'bloc/cartlistBloc.dart';
import 'cart.dart';
import 'package:showcaseview/showcaseview.dart';
import 'model/food_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs: [
        //add yours BLoCs controlles
        Bloc((i) => CartListBloc()),
        Bloc((i) => ColorBloc()),
      ],
      child: MaterialApp(
        title: "Food Delivery",
        home: Home(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class KeysToBeInherited extends InheritedWidget {
  final GlobalKey cartIndicatorKey;
  final GlobalKey categoriesKey;
  final GlobalKey optionsKey;
  final GlobalKey searchKey;
  final GlobalKey nameKey;

  KeysToBeInherited({
    this.cartIndicatorKey,
    this.categoriesKey,
    this.optionsKey,
    this.nameKey,
    this.searchKey,
    Widget child,
  }) : super(child: child);

  static KeysToBeInherited of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(KeysToBeInherited);
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ShowCaseWidget(
        child: HomeBody(),
      ),
    );
  }
}

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  GlobalKey _optionsKey = GlobalKey();
  GlobalKey _cartIndicatorKey = GlobalKey();
  GlobalKey _searchKey = GlobalKey();
  GlobalKey _categoriesKey = GlobalKey();
  GlobalKey _nameKey = GlobalKey();

  @override
  Widget build(BuildContext context) {

    SharedPreferences preferences;

    displayShowcase() async {
      preferences = await SharedPreferences.getInstance();
      bool showcaseVisibilityStatus = preferences.getBool("showShowcase");

      if (showcaseVisibilityStatus == null) {
        preferences.setBool("showShowcase", false).then((bool success) {
          if (success)
            print("Successfull in writing showshoexase");
          else
            print("some bloody problem occured");
        });

        return true;
      }

      return false;
    }

    displayShowcase().then((status) {
      if (status) {
        ShowCaseWidget.startShowCase(context, [
          _optionsKey,
          _cartIndicatorKey,
          _nameKey,
          _searchKey,
          _categoriesKey
        ]);
      }
    });

    return KeysToBeInherited(
      nameKey: _nameKey,
      cartIndicatorKey: _cartIndicatorKey,
      categoriesKey: _categoriesKey,
      optionsKey: _optionsKey,
      searchKey: _searchKey,
      child: SafeArea(
        child: Container(
          child: ListView(
            children: <Widget>[
              FirstHalf(),
              SizedBox(height: 45),
              for (var foodItem in fooditemList.foodItems)
                Builder(
                  builder: (context) {
                    return ItemContainer(foodItem: foodItem);
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemContainer extends StatelessWidget {
  ItemContainer({
    @required this.foodItem,
  });

  final FoodItem foodItem;
  final CartListBloc bloc = BlocProvider.getBloc<CartListBloc>();

  addToCart(FoodItem foodItem) {
    bloc.addToList(foodItem);
  }

  removeFromList(FoodItem foodItem) {
    bloc.removeFromList(foodItem);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        addToCart(foodItem);
        final snackBar = SnackBar(
          content: Text('${foodItem.title} added to Cart'),
          duration: Duration(milliseconds: 550),
        );

        Scaffold.of(context).showSnackBar(snackBar);
      },
      child: Items(
        hotel: foodItem.hotel,
        itemName: foodItem.title,
        itemPrice: foodItem.price,
        imgUrl: foodItem.imgUrl,
        leftAligned: (foodItem.id % 2) == 0 ? true : false,
      ),
    );
  }
}

class FirstHalf extends StatelessWidget {
  const FirstHalf({
    Key key,
  }) : super(key: key);

  Widget searchBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Icon(
          Icons.search,
          color: Colors.black45,
        ),
        SizedBox(width: 20),
        Expanded(
          child: TextField(
            decoration: InputDecoration(
                hintText: "Search....",
                contentPadding: EdgeInsets.symmetric(vertical: 10),
                hintStyle: TextStyle(
                  color: Colors.black87,
                ),
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red))),
          ),
        ),
      ],
    );
  }

  Widget title() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(width: 45),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Food",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 30,
              ),
            ),
            Text(
              "Delivery",
              style: TextStyle(
                fontWeight: FontWeight.w200,
                fontSize: 30,
              ),
            ),
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final getKeys = KeysToBeInherited.of(context);

    return Container(
      margin: const EdgeInsets.fromLTRB(35, 25, 0, 0),
      child: Column(
        children: <Widget>[
          CustomAppBar(),
          //you could also use the spacer widget to give uneven distances, i just decided to go with a sizebox
          SizedBox(height: 30),
          Showcase(
            key: getKeys.nameKey,
            description:
            "This is the name of our app, INCASE, you didn't notice",
            child: title(),
          ),
          SizedBox(height: 30),
          Showcase(
            key: getKeys.searchKey,
            description: "This is where you type in a query",
            child: searchBar(),
          ),
          SizedBox(height: 45),
          Showcase(
            key: getKeys.categoriesKey,
            description: "Choose from not thousands but 5 categories",
            child: categories(),
          ),
        ],
      ),
    );
  }
}

Widget categories() {
  return Container(
    height: 185,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        CategoryListItem(
          categoryIcon: Icons.bug_report,
          categoryName: "Burgers",
          availability: 12,
          selected: true,
        ),
        CategoryListItem(
          categoryIcon: Icons.bug_report,
          categoryName: "Pizza",
          availability: 12,
          selected: false,
        ),
        CategoryListItem(
          categoryIcon: Icons.bug_report,
          categoryName: "Rolls",
          availability: 12,
          selected: false,
        ),
        CategoryListItem(
          categoryIcon: Icons.bug_report,
          categoryName: "Burgers",
          availability: 12,
          selected: false,
        ),
        CategoryListItem(
          categoryIcon: Icons.bug_report,
          categoryName: "Burgers",
          availability: 12,
          selected: false,
        ),
      ],
    ),
  );
}

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartListBloc bloc = BlocProvider.getBloc<CartListBloc>();
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Showcase(
            key: KeysToBeInherited.of(context).optionsKey,
            description: "Click here to open the options drawer",
            child: Icon(Icons.menu),
          ),
          StreamBuilder(
            stream: bloc.listStream,
            builder: (context, snapshot) {
              List<FoodItem> foodItems = snapshot.data;
              int length = foodItems != null ? foodItems.length : 0;

              return buildGestureDetector(length, context, foodItems);
            },
          )
        ],
      ),
    );
  }

  GestureDetector buildGestureDetector(
      int length, BuildContext context, List<FoodItem> foodItems) {
    return GestureDetector(
      onTap: () {
        if (length > 0) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Cart()));
        }
      },
      child: Showcase(
        key: KeysToBeInherited.of(context).cartIndicatorKey,
        description: "Click here to review the items in your cart",
        showcaseBackgroundColor: Colors.yellow[100],
        descTextStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.yellowAccent[900]),
        child: Container(
          margin: EdgeInsets.only(right: 30),
          child: Text(length.toString()),
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Colors.yellow[800],
              borderRadius: BorderRadius.circular(50)),
        ),
      ),
    );
  }
}*/
import 'dart:developer';

import 'package:telescopium/patient_info.dart';
import 'package:telescopium/Camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';

class CardDetail{
  String title ;
  String subtitle;
  Color color;
  CardDetail({this.title,this.subtitle,this.color});
}
class DashBoard extends StatefulWidget{
  @override
  _DashBoardState createState()=>_DashBoardState();
  bool a0,a1,a2;
  double count;
  DashBoard({this.a0,this.a1,this.a2,this.count});

}

class _DashBoardState extends State<DashBoard>
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
    WidgetsBinding.instance.addPostFrameCallback((_) =>
        ShowCaseWidget.of(context)
            .startShowCase([_one, _two, _three, _four, _five]));
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
                              image: AssetImage('assets/backlog.jpg'),
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
                              image: AssetImage('assets/backlog.jpg'),
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
                              image: AssetImage('assets/backlog.jpg'),
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
}