import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:moody/pages/homePage.dart';
import 'dart:async';

class loading extends StatefulWidget {
  const loading({Key? key}) : super(key: key);

  @override
  State<loading> createState() => _loadingState();

}

class _loadingState extends State<loading> {
  //Navigator.pushNamed(context, '/home'),


  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });
    return Scaffold(
      backgroundColor: Colors.blue[900],
     body: Center(
          child: SpinKitFoldingCube(
           color: Colors.white,
           size: 80.0,
         ),
     ),
    );
  }
}
