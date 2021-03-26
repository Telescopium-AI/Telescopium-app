import 'dart:io';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:url_launcher/url_launcher.dart';
class Report extends StatefulWidget{
  _ReportState createState()=> _ReportState();
}
class _ReportState extends State<Report>{
  PDFDocument _doc;
  String pdfasset="assets/jceh_32_107_S1.pdf";
  bool _loading;
  @override
  void initState(){
    super.initState();

      _initpdf();
  }
  _initpdf()async{
    setState(() {
      _loading=true;
    });
    final doc=await PDFDocument.fromURL("http://www.pdf995.com/samples/pdf.pdf");
  setState(() {
    _doc=doc;
    _loading=false;
  });
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    launchURL() {
      launch('https://flutter.dev');
    }
    return Scaffold(
      appBar: AppBar(title: Text('Health Report',),backgroundColor: Color.fromRGBO(64, 75, 96, .9)

      ),
      /*body: _loading? Center(
        child: CircularProgressIndicator(),
      ):PDFViewer(document: _doc)*/
      //path: 'assets/jceh_32_107_S1.pdf',
      body: Center(
        child: ElevatedButton(
          onPressed: launchURL,
          child: Text('Show Flutter homepage'),
        ),
      ),

    );

  }

}