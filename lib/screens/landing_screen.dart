import 'package:flutter/material.dart';
import 'package:mythical_app/screens/home_screen.dart';
import 'package:mythical_app/utils/colors.dart';
import 'package:mythical_app/widgets/button_widget.dart';
import 'package:mythical_app/widgets/text_widget.dart';

class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: primary,
            image: const DecorationImage(
                opacity: 300,
                fit: BoxFit.cover,
                image: AssetImage('assets/images/background.png'))),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 50, 30, 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 80,
              ),
              TextBold(
                  text: 'AKLAT :\nFilipino\nMythical\nCreatures',
                  fontSize: 48,
                  color: Colors.white),
              TextRegular(
                  text: 'The app that contains filipino mythical creatures',
                  fontSize: 20,
                  color: Colors.white),
              const Expanded(
                child: SizedBox(
                  height: 200,
                ),
              ),
              Center(
                  child: ButtonWidget(
                      onPressed: (() {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => HomeScreen()));
                      }),
                      text: 'Get Started')),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
