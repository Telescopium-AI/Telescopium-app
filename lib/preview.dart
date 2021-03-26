import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:telescopium/Home_page2.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:showcaseview/showcaseview.dart';


class PreviewImageScreen extends StatefulWidget {
  String imagePath;
  int index;
double p;
  PreviewImageScreen({this.imagePath,this.index,this.p});

  @override
  _PreviewImageScreenState createState() => _PreviewImageScreenState();
}

class _PreviewImageScreenState extends State<PreviewImageScreen> {
  //int index;
  //_PreviewImageScreenState(this.index);
  List _result;
  String _confidence="";
  String _name="";
  String numbers='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(
        //title: Text('Preview'),
        //backgroundColor: Colors.blueGrey,
      //),
      body: Container(
        color:Color.fromRGBO(0, 0, 0, 1) ,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                flex: 2,
                child: Image.file(File(widget.imagePath), fit: BoxFit.cover)),
            SizedBox(height: 30.0),
            Flexible(
              flex: 0,
              child: Row(
                //padding: EdgeInsets.all(10.0),
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                children:<Widget>[
                  MaterialButton(onPressed: (){
                    getImage();
                  },
                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(
            Radius.circular(16),)),
                    color: Colors.indigoAccent,
                    textColor: Colors.white,
                    child: Text("Crop",style:TextStyle(fontSize: 22,color: Colors.white,height: 1.5)),
                    //child: Icon(Icons.crop,),
                    padding: EdgeInsets.all(16),
                    //shape: CircleBorder(),
                  ),

                  MaterialButton(
                    onPressed: (){
                      if(widget.index==0)
                        Navigator.push(context, new MaterialPageRoute(
                          builder: (context)=>new Scaffold(
                            body: ShowCaseWidget(
                              onStart: (index, key) {
                                log('onStart: $index, $key');
                              },
                              onComplete: (index, key) {
                                log('onComplete: $index, $key');
                              },
                              builder: Builder(builder: (context) => new Dashboard(a0: false,a1: true,a2: true,count: (100/3)+widget.p,)),
                              autoPlay: false,
                              autoPlayDelay: Duration(seconds: 3),
                              autoPlayLockEnable: false,
                            ),
                          ),
                        ));//builder: (context)=>new Dashboard(a0: false,a1: true,a2: true,count: (100/3)+widget.p,)));
                      else if(widget.index==1){
                        Navigator.push(context, new MaterialPageRoute(
                          builder: (context)=>new Scaffold(
                            body: ShowCaseWidget(
                              onStart: (index, key) {
                                log('onStart: $index, $key');
                              },
                              onComplete: (index, key) {
                                log('onComplete: $index, $key');
                              },
                              builder: Builder(builder: (context) => new Dashboard(a0: false,a1: false,a2: true,count: (100/3)+widget.p,)),
                              autoPlay: false,
                              autoPlayDelay: Duration(seconds: 3),
                              autoPlayLockEnable: false,
                            ),
                          ),
                        ));}
                        //Navigator.push(context, new MaterialPageRoute(builder: (context)=>new Dashboard(a0: false,a1: false,a2: true,count: (100/3)+widget.p,)));
                      else if(widget.index==2){
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
                      }
                        //Navigator.push(context, new MaterialPageRoute(builder: (context)=>new Dashboard(a0: false,a1: false,a2: false,count: (100/3)+widget.p,)));
                      //else
                      //Navigator.push(context, new MaterialPageRoute(builder: (context)=>new Dashboard(true,false,true)));
                    },
                    color: Colors.indigoAccent,

                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(
                      Radius.circular(16),)),
                    textColor: Colors.white,
                    child: Text("Next",style:TextStyle(fontSize: 22,color: Colors.white,height: 1.5)),
                    padding: EdgeInsets.all(16),
                    //shape: CircleBorder(),

                    //elevation: 5,

                  ),

                  /*RaisedButton(
                      child: Icon(Icons.crop),
                      onPressed:(){ getImage();}),*/
              ]),
            ),
          ],
        ),
      ),
    );
  }
  // Eye classification integration
  applyModelOnImage()async{

    var res= await Tflite.runModelOnImage(
      path: widget.imagePath,
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,

    );

    setState(() {
      _result=res;
      String str=_result[0]["label"];
      //_name=str.substring(2);
      //_confidence=_result !=null? _result[0]['confidence']*100.0.toString().substring(0,2)+'%':"";

    });


  }
  loadMyModel() async{
    var resultant=await Tflite.loadModel(
      model: "assets/model.tflite",
      labels: "assets/labels.txt",
    );
    print("Result after loading model: $resultant");

  }
  @override
  void initState(){
    super.initState();
    loadMyModel();
  }
  // get the image from path
  getImage()async{
    if(widget.imagePath !=null){
      File cropped=await ImageCropper.cropImage(sourcePath: widget.imagePath,
      aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
      compressQuality: 100,
        maxHeight: 700,
        maxWidth: 700,
        compressFormat: ImageCompressFormat.png,
        androidUiSettings: AndroidUiSettings(
          toolbarColor: Colors.deepOrangeAccent,
          toolbarTitle: "Croping",

        )
      );
      this.setState(() {
        widget.imagePath=cropped.path;
      });
    }
  }
  Future<ByteData> getBytesFromFile() async {
    Uint8List bytes = File(widget.imagePath).readAsBytesSync() as Uint8List;
    return ByteData.view(bytes.buffer);
  }
}
