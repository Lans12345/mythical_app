import 'dart:async';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mythical_app/screens/landing_screen.dart';
import 'package:mythical_app/utils/colors.dart';
import 'package:mythical_app/widgets/text_widget.dart';

class SplashScreen extends StatefulWidget {
  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 5), () async {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LandingScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:
          false, //code para mawala to ang debug nga pula sa top right sa app screen
      home: Scaffold(
        backgroundColor: Colors.red[50],
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitDoubleBounce(
              color: primary,
              size: 280.0,
            ),
            SizedBox(
              height: 50,
            ),
            TextRegular(text: 'Loading...', fontSize: 12, color: primary)
          ],
        )),
      ),
    );
  }
}
