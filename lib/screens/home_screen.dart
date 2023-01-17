import 'package:flutter/material.dart';
import 'package:mythical_app/utils/colors.dart';
import 'package:mythical_app/widgets/text_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextBold(
                        text: 'Filipino mythical ',
                        fontSize: 28,
                        color: Colors.white),
                    TextBold(
                        text: 'creatures', fontSize: 28, color: Colors.white),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: TextFormField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.grey,
                            ),
                            border: InputBorder.none,
                            hintText: 'Search',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'QRegular',
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            height: 180,
            color: primary,
          ),
          // Container(
          //   height: 500,
          //   width: double.infinity,
          //   decoration: BoxDecoration(
          //       image: DecorationImage(
          //           image: AssetImage('assets/images/background1.png'))),
          // ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/background1.png'))),
              child: ListView.builder(itemBuilder: ((context, index) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(30, 2.5, 30, 2.5),
                  child: GestureDetector(
                    onTap: (() {}),
                    child: Card(
                      elevation: 20,
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/images/sample.png',
                                height: 80,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextRegular(
                                      text: 'Balbal (Bal-Bal)',
                                      fontSize: 16,
                                      color: Colors.black),
                                  SizedBox(
                                    width: 150,
                                    child: TextRegular(
                                        text:
                                            'is an undead creature that steals corpses, whether from a funeral or grave, and feeds on them.',
                                        fontSize: 12,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        height: 120,
                        width: double.infinity,
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              })),
            ),
          ),
        ],
      ),
    );
  }
}
