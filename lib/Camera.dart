import 'dart:async';


import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:showcaseview/showcaseview.dart';

import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';
import 'package:telescopium/preview.dart';
//import 'package:telescopium/shape_painter.dart';
import 'package:video_player/video_player.dart';

class CameraScreen extends StatefulWidget {
  int index;
  double p;
  CameraScreen(this.index,this.p);
  @override
  _CameraScreenState createState() {
    return _CameraScreenState(index: index,p: p);
  }
}

class _CameraScreenState extends State {
  //Camera controller;
  double p;
  GlobalKey _one = GlobalKey();
  GlobalKey _two = GlobalKey();
  _CameraScreenState({this.index,this.p});
  CameraController controller;
  List cameras;
  int selectedCameraIdx,index;
  String imagePath;
  VideoPlayerController playerController;

  @override
  void initState() {
    super.initState();
    playerController=VideoPlayerController.asset('assets/Ehb.mp4');

    playerController.play();
    WidgetsBinding.instance.addPostFrameCallback((_) =>
        ShowCaseWidget.of(context)
            .startShowCase([_one,_two ]));

    availableCameras().then((availableCameras) {



      cameras = availableCameras;

      if (cameras.length > 0) {
        setState(() {
          selectedCameraIdx = 0;
        });

        _initCameraController(cameras[selectedCameraIdx]).then((void v) {});
      }else{
        print("No camera available");
      }
    }).catchError((err) {
      print('Error: $err.code\nError Message: $err.message');
    });
  }

  Future _initCameraController(CameraDescription cameraDescription) async {
    if (controller != null) {
      await controller.dispose();
    }

    controller = CameraController(cameraDescription, ResolutionPreset.high,);


    // If the controller is updated then update the UI.
    controller.addListener(() {
      if (mounted) {
        setState(() {});
      }

      if (controller.value.hasError) {
        print('Camera error ${controller.value.errorDescription}');
      }
    });

    try {
      await controller.initialize();
    } on CameraException catch (e) {
      _showCameraException(e);
    }

    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(
        //title: const Text('Click To Share'),
        //backgroundColor: Colors.blueGrey,
      //),


      body: Container(
        color:Color.fromRGBO(0, 0, 0, 1) ,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: <Widget>[

              Expanded(
                flex: 1,
                child: _cameraPreviewWidget(),
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,

                children: [
                  _cameraTogglesRowWidget(),
                  _captureControlRowWidget(context),

                  Spacer()
                ],
              ),
              SizedBox(height: 10.0)
            ],
          ),
        ),
      ),
    );
  }

  /// Display Camera preview.
  Widget _cameraPreviewWidget() {

    if (controller == null || !controller.value.isInitialized) {
      return const Text(
        'Loading',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.w900,
        ),
      );
    }
    /*return Container(
        child: Column(
          children: <Widget>[
            CustomPaint(painter: ShapePainter(),),
            AspectRatio(aspectRatio: controller.value.aspectRatio,child: CameraPreview(controller),)
          ],
        ),
     // child: OverflowBox(
       // child: CustomPaint(
         // painter: ShapePainter(),

          //child:AspectRatio(aspectRatio: controller.value.aspectRatio,child: CameraPreview(controller),) ,
        //),
      //),
    );*/
    /*return ClipOval(
      child: OverflowBox(
        alignment: Alignment.center,
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Container(
            width: 100,
            height: 100/controller.value.aspectRatio,
            child: AspectRatio(
              aspectRatio: controller.value.aspectRatio,
              child: CameraPreview(controller),
            ),
          ),
        ),
      ),
    );*/
    return AspectRatio(
      aspectRatio: controller.value.aspectRatio,

      child: OverflowBox(child:CustomPaint(
//RadialGradient(colors: [Colors.white10.withOpacity(1),Colors.black54.withOpacity(0.9)],radius: 0.5).createShader(bouns)
        child: ShaderMask(shaderCallback: (Rect bouns){return RadialGradient(colors: [Colors.white10.withOpacity(1),Colors.grey[800]/*.withOpacity(0.9)*/],radius: 0.5,).createShader(bouns); },
          child:Container(
          child:Stack(children:<Widget>[CameraPreview(controller),
            Positioned(
              top: MediaQuery.of(context).size.height * .2,
              right: MediaQuery.of(context).size.width * .2,
              child: Showcase(
              key: _one,
              title: ' Eye',
              description:
              'focus on Patient Eye ',
              contentPadding: EdgeInsets.all(8.0),
              showcaseBackgroundColor: Colors.blueAccent,
              textColor: Colors.white,
              shapeBorder: CircleBorder(),
              child: Container(
                alignment: Alignment.center,
                width: 250,
                height: 250,
                //child: Image.asset("assets/download.jpeg")//(playerController!=null ? VideoPlayer(playerController):Container()),
               decoration: BoxDecoration(

                shape: BoxShape.circle,

                  image: DecorationImage(
                    fit: BoxFit.fill,

                    image: AssetImage('assets/download.png'),
                  ),
                ),
              ),
            ),)]) )),//new AspectRatio(aspectRatio: controller.value.aspectRatio,child: CameraPreview(controller),),
        //painter: ShapePainter().paint(controller,50),
      ),
      //child:CameraPreview(controller,)
        )
    );
  }

  /// Display the control bar with buttons to take pictures
  Widget _captureControlRowWidget(context) {
    return MaterialButton(onPressed: (){_onCapturePressed(context);},
      color: Colors.transparent,
      textColor: Colors.white,
      child:Showcase(
        key: _two,
        description: 'Tap to take a picture',
        child: Icon(
          Icons.camera_alt_outlined,size: 40,
          //color: Colors.black45,
        ),
      ),//Icon(Icons.camera_alt_outlined,size: 40,),
      padding: EdgeInsets.all(16),
      shape: CircleBorder(),
    );
    /*return Expanded(
      child: Align(
        alignment: Alignment.center,

        child: Row(

          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [

            FloatingActionButton(
                child: Icon(Icons.camera_alt_outlined,size: 40,),
                backgroundColor: Colors.transparent,
                onPressed: () {
                  _onCapturePressed(context);
                })
          ],
        ),
      ),
    );*/
  }

  /// Display a row of toggle to select the camera (or a message if no camera is available).
  Widget _cameraTogglesRowWidget() {
    if (cameras == null || cameras.isEmpty) {
      return Spacer();
    }

    CameraDescription selectedCamera = cameras[selectedCameraIdx];
    CameraLensDirection lensDirection = selectedCamera.lensDirection;

    return Expanded(
      child: Align(
        alignment: Alignment.centerLeft,
        child: FlatButton.icon(
            onPressed: _onSwitchCamera,

            icon: _getCameraLensIcon(lensDirection),
            label: Text(
                "${lensDirection.toString().substring(lensDirection.toString().indexOf('.') + 1)}")),
      ),
    );
  }

  Icon _getCameraLensIcon(CameraLensDirection direction) {
    switch (direction) {
      case CameraLensDirection.back:
        //return MdiIcons.camera;
        return Icon(Icons.switch_camera_outlined,size: 40,color: Colors.white,);
      case CameraLensDirection.front:
        return Icon(Icons.switch_camera_outlined,size: 40,color: Colors.white);
      case CameraLensDirection.external:
        return Icon(Icons.camera_alt_outlined,size: 40,color: Colors.white);
      default:
        return Icon(Icons.device_unknown,size: 40,color: Colors.white);
    }
  }

  void _onSwitchCamera() {
    selectedCameraIdx =
    selectedCameraIdx < cameras.length - 1 ? selectedCameraIdx + 1 : 0;
    CameraDescription selectedCamera = cameras[selectedCameraIdx];
    _initCameraController(selectedCamera);
  }

  void _onCapturePressed(context) async {
    // Take the Picture in a try / catch block. If anything goes wrong,
    // catch the error.
    try {
      // Attempt to take a picture and log where it's been saved
      final path = join(
        // In this example, store the picture in the temp directory. Find
        // the temp directory using the `path_provider` plugin.
        (await getTemporaryDirectory()).path,
        '${DateTime.now()}.png',
      );
      print(path);
      await controller.takePicture(path);

      // If the picture was taken, display it on a new screen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PreviewImageScreen(imagePath: path,index: index,p: p,),
        ),
      );
    } catch (e) {
      // If an error occurs, log the error to the console.
      print(e);
    }
  }

  void _showCameraException(CameraException e) {
    String errorText = 'Error: ${e.code}\nError Message: ${e.description}';
    print(errorText);

    print('Error: ${e.code}\n${e.description}');
  }
}
