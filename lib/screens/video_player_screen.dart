import 'package:flutter/material.dart';
import 'package:mythical_app/screens/home_screen.dart';
import 'package:mythical_app/utils/colors.dart';
import 'package:mythical_app/widgets/text_widget.dart';

import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/images/samplevid.mp4')
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/background1.png'))),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: IconButton(
                    onPressed: (() {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => HomeScreen()));
                    }),
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: primary,
                    )),
              ),
              SizedBox(
                height: 100,
              ),
              Center(
                child: _controller.value.isInitialized
                    ? Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AspectRatio(
                              aspectRatio: _controller.value.aspectRatio,
                              child: VideoPlayer(_controller),
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextRegular(
                                      text: 'Balbal (Bal-Bal)',
                                      fontSize: 18,
                                      color: Colors.black),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: SizedBox(
                                      width: 300,
                                      child: TextRegular(
                                          text:
                                              'is an undead creature that steals corpses, whether from a funeral or grave, and feeds on them.',
                                          fontSize: 14,
                                          color: Colors.grey),
                                    ),
                                  ),
                                ],
                              ),
                              width: double.infinity,
                              decoration: BoxDecoration(color: Colors.white),
                            ),
                          ],
                        ),
                      )
                    : Container(),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: TextBold(
                    text: 'Suggested creatures',
                    fontSize: 14,
                    color: Colors.black),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                      child: TextRegular(
                          text: 'Sigbin', fontSize: 12, color: Colors.black),
                      height: 30,
                      color: Colors.white,
                      onPressed: (() {})),
                  MaterialButton(
                      child: TextRegular(
                          text: 'Kapre', fontSize: 12, color: Colors.black),
                      height: 30,
                      color: Colors.white,
                      onPressed: (() {})),
                  MaterialButton(
                      child: TextRegular(
                          text: 'Tikbalang', fontSize: 12, color: Colors.black),
                      height: 30,
                      color: Colors.white,
                      onPressed: (() {})),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primary,
        onPressed: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
