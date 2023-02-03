import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mythical_app/screens/video_player_screen.dart';
import 'package:mythical_app/services/data/creatures_data.dart';
import 'package:mythical_app/utils/colors.dart';
import 'package:mythical_app/widgets/text_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String filter = '';

  final filterController = TextEditingController();

  final box = GetStorage();

  List<Map<String, dynamic>> newData = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 180,
            color: primary,
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
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: TextFormField(
                        controller: filterController,
                        onChanged: ((value) {
                          filter = value;
                          setState(() {
                            newData = creaturesData
                                .where((element) => element['name']!
                                    .toLowerCase()
                                    .contains(value.toLowerCase()))
                                .toList();
                          });
                        }),
                        decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.search,
                              color: Colors.grey,
                            ),
                            suffixIcon: filter != ''
                                ? IconButton(
                                    onPressed: (() {
                                      setState(() {
                                        filterController.clear();
                                        filter = '';
                                      });
                                    }),
                                    icon: const Icon(Icons.close))
                                : const SizedBox(),
                            border: InputBorder.none,
                            hintText: 'Search',
                            hintStyle: const TextStyle(
                              color: Colors.grey,
                              fontFamily: 'QRegular',
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Container(
          //   height: 500,
          //   width: double.infinity,
          //   decoration: BoxDecoration(
          //       image: DecorationImage(
          //           image: AssetImage('assets/images/background1.png'))),
          // ),
          filter == ''
              ? Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image:
                                AssetImage('assets/images/background1.png'))),
                    child: ListView.builder(
                        itemCount: creaturesData.length,
                        itemBuilder: ((context, index) {
                          return Padding(
                            padding:
                                const EdgeInsets.fromLTRB(30, 2.5, 30, 2.5),
                            child: GestureDetector(
                              onTap: (() {
                                box.write('data', creaturesData[index]);
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            VideoPlayerScreen()));
                              }),
                              child: Card(
                                elevation: 20,
                                child: Container(
                                  width: double.infinity,
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10, bottom: 5, top: 5),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          creaturesData[index]['image']!,
                                          height: 80,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            TextRegular(
                                                text: creaturesData[index]
                                                    ['name']!,
                                                fontSize: 16,
                                                color: Colors.black),
                                            SizedBox(
                                              width: 125,
                                              child: Text(
                                                creaturesData[index]
                                                    ['description']!,
                                                maxLines: 5,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                    fontFamily: 'QRegular'),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        })),
                  ),
                )
              : Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image:
                                AssetImage('assets/images/background1.png'))),
                    child: Column(
                      children: [
                        Expanded(
                          child: SizedBox(
                            child: ListView.builder(
                                itemCount: newData.length,
                                itemBuilder: ((context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        30, 2.5, 30, 2.5),
                                    child: GestureDetector(
                                      onTap: () {
                                        box.write('data', newData[index]);
                                        Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    VideoPlayerScreen()));
                                        Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    VideoPlayerScreen()));
                                      },
                                      child: Card(
                                        elevation: 20,
                                        child: Container(
                                          height: 120,
                                          width: double.infinity,
                                          color: Colors.white,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10, right: 10),
                                            child: Row(
                                              children: [
                                                Image.asset(
                                                  newData[index]['image']!,
                                                  height: 80,
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    TextRegular(
                                                        text: newData[index]
                                                            ['name'],
                                                        fontSize: 16,
                                                        color: Colors.black),
                                                    SizedBox(
                                                      width: 120,
                                                      child: Text(
                                                        newData[index]
                                                            ['description']!,
                                                        maxLines: 5,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: const TextStyle(
                                                            fontSize: 12,
                                                            color: Colors.black,
                                                            fontFamily:
                                                                'QRegular'),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                })),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextBold(
                            text: 'Suggested creatures',
                            fontSize: 12,
                            color: Colors.black),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        'assets/images/background1.png'))),
                            child: ListView.builder(
                                itemCount: creaturesData.length,
                                itemBuilder: ((context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        30, 2.5, 30, 2.5),
                                    child: GestureDetector(
                                      onTap: (() {
                                        box.write('data', creaturesData[index]);
                                        Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    VideoPlayerScreen()));
                                      }),
                                      child: Card(
                                        elevation: 20,
                                        child: Container(
                                          width: double.infinity,
                                          color: Colors.white,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10,
                                                right: 10,
                                                bottom: 5,
                                                top: 5),
                                            child: Row(
                                              children: [
                                                Image.asset(
                                                  creaturesData[index]
                                                      ['image']!,
                                                  height: 80,
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    TextRegular(
                                                        text:
                                                            creaturesData[index]
                                                                ['name']!,
                                                        fontSize: 16,
                                                        color: Colors.black),
                                                    SizedBox(
                                                      width: 125,
                                                      child: Text(
                                                        creaturesData[index]
                                                            ['description']!,
                                                        maxLines: 5,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: const TextStyle(
                                                            fontSize: 12,
                                                            color: Colors.black,
                                                            fontFamily:
                                                                'QRegular'),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                })),
                          ),
                        )
                      ],
                    ),
                  ),
                )
        ],
      ),
    );
  }
}
