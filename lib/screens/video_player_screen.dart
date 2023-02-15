import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mythical_app/screens/home_screen.dart';
import 'package:mythical_app/services/data/creatures_data.dart';
import 'package:mythical_app/utils/colors.dart';
import 'package:mythical_app/widgets/text_widget.dart';
import 'dart:math';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

var random = Random();

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset(box.read('data')['video'])
      ..initialize().then((_) {
        _controller.setVolume(1);
        setState(() {});
      });
  }

  final box = GetStorage();

  var newList = List.from(creaturesData)..shuffle(random);

  Future<bool> onWillPop() async {
    final shouldPop = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Are you sure?'),
        content: const Text('Do you want to leave this page?'),
        actions: <Widget>[
          MaterialButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('No'),
          ),
          MaterialButton(
            onPressed: () {
              _controller.dispose();
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );

    return shouldPop ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/background1.png'))),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: IconButton(
                        onPressed: (() {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()));
                        }),
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: primary,
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: _controller.value.isInitialized
                        ? Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  child: AspectRatio(
                                    aspectRatio: _controller.value.aspectRatio,
                                    child: VideoPlayer(_controller),
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  decoration:
                                      const BoxDecoration(color: Colors.white),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      TextRegular(
                                          text: box.read('data')['name'],
                                          fontSize: 18,
                                          color: Colors.black),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 20),
                                        child: SizedBox(
                                          width: 300,
                                          child: TextRegular(
                                              text: box
                                                  .read('data')['description'],
                                              fontSize: 14,
                                              color: Colors.grey),
                                        ),
                                      ),
                                      TextRegular(
                                          text: 'Weakness',
                                          fontSize: 14,
                                          color: Colors.black),
                                      Center(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 20),
                                          child: TextRegular(
                                              text:
                                                  box.read('data')['weakness'],
                                              fontSize: 12,
                                              color: Colors.grey),
                                        ),
                                      ),
                                      TextRegular(
                                          text: 'Source:',
                                          fontSize: 14,
                                          color: Colors.black),
                                      Center(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 20),
                                          child: TextRegular(
                                              text: 'cryptidz.fandom.com',
                                              fontSize: 12,
                                              color: Colors.grey),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Container(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: TextBold(
                        text: 'Suggested creatures',
                        fontSize: 14,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: SizedBox(
                      height: 50,
                      width: 300,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 5, right: 5),
                              child: MaterialButton(
                                  height: 20,
                                  color: Colors.white,
                                  onPressed: (() {
                                    box.write('data', newList[index]);
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                VideoPlayerScreen()));
                                  }),
                                  child: TextRegular(
                                      text: newList[index]['name'],
                                      fontSize: 12,
                                      color: Colors.black)),
                            );
                          }),
                    ),
                  ),
                  const SizedBox(
                    height: 200,
                  ),
                ],
              ),
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
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
