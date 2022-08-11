import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_3/constant.dart';
import 'package:flutter_application_3/profilepage/profile.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/icon_park_outline.dart';

class UIMovieMain extends StatefulWidget {
  const UIMovieMain({Key? key}) : super(key: key);

  @override
  State<UIMovieMain> createState() => _UIMovieMainState();
}

class _UIMovieMainState extends State<UIMovieMain> {
  int currentIndex = 0;

  void tiklama(int clickIndex) {
    setState(() {
      currentIndex = clickIndex;
    });
  }

  List<Widget> itemsDataImage = [];
  List<dynamic> categories = [
    'Bilim Kurgu',
    'Aksiyon',
    'Korku',
    'Aksiyon',
    'Anime',
    'Fantastik',
    'Komedi',
    'Romantik Komedi'
  ];

  void imageData() {
    List<dynamic> imagelists = DATA_IMAGE;
    List<Widget> listItems = [];
    imagelists.forEach((postAdd) {
      listItems.add(
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/${postAdd["image"]}'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      );
    });
    setState(() {
      itemsDataImage = listItems;
    });
  }

  @override
  void initState() {
    super.initState();
    imageData();
  }

  double _generateDouble2(double minValue, double maxValue, int precision) {
    final random = new Random();
    final doubleRandom = minValue + (maxValue - minValue) * random.nextDouble();
    return double.parse(doubleRandom.toStringAsFixed(precision));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: appBarMethod(context),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(children: [
                Container(
                  width: size.width,
                  height: size.height / 3 * 2,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/banner.webp'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: size.width,
                  height: size.height / 3 * 2,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withAlpha(0),
                        Colors.black.withAlpha(50),
                        Colors.black.withAlpha(100),
                        Colors.black.withAlpha(200),
                        Colors.black,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
                Positioned(
                    top: size.height / 3,
                    child: Container(
                      color: Colors.black.withAlpha(100),
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/title_img.webp',
                            fit: BoxFit.cover,
                            width: 300,
                          ),
                          SizedBox(
                            width: 250,
                            height: 50,
                            child: ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  "HEMEN İZLE",
                                  style: TextStyle(fontSize: 24),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.white.withAlpha(70),
                                )),
                          ),
                        ],
                      ),
                    )),
              ]),
              viewMovieSelect(),
              categoriesMovie(),
            ],
          ),
        ),
        bottomNavigationBar: bottomBarUI(),
      ),
    );
  }

  Container categoriesMovie() {
    // ignore: sized_box_for_whitespace
    return Container(
      height: 100,
      child: Expanded(
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: const ClampingScrollPhysics(),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              margin: const EdgeInsets.all(20),
              height: 30,
              decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.white, style: BorderStyle.solid, width: 2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                  child: Text(
                categories[index],
                style: const TextStyle(color: Colors.white),
              )),
            );
          },
        ),
      ),
    );
  }

  Container viewMovieSelect() {
    return Container(
      height: 300,
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Expanded(
          child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: itemsDataImage.length,
              itemBuilder: (context, index) {
                var rng = Random();
                for (var i = 0; i < 10; i++) {
                  // ignore: avoid_print
                  print(rng.nextInt(100));
                }
                ;
                return Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(20),
                      width: 150,
                      child: itemsDataImage[index],
                    ),
                    Container(
                      margin: const EdgeInsets.all(20),
                      width: 150,
                      height: 300,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                            Colors.black12,
                            Colors.black,
                          ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 200,
                            height: 100,
                            color: Colors.black.withAlpha(140),
                            child: Center(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: const [
                                      Text(
                                        "Göster",
                                        style: TextStyle(
                                          fontSize: 24,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Icon(
                                        Icons.remove_red_eye,
                                        size: 24,
                                        color: Colors.white24,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "Imdb",
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                          ((rng.nextDouble() * 4.9) + 5)
                                              .toStringAsFixed(1),
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 16),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: const [
                                      Icon(
                                        Icons.star_rounded,
                                        color: Colors.yellow,
                                      ),
                                      Icon(
                                        Icons.star_rounded,
                                        color: Colors.yellow,
                                      ),
                                      Icon(
                                        Icons.star_rounded,
                                        color: Colors.yellow,
                                      ),
                                      Icon(
                                        Icons.star_half_rounded,
                                        color: Colors.yellow,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                );
              })),
    );
  }

  BottomNavigationBar bottomBarUI() {
    return BottomNavigationBar(
        elevation: 0,
        iconSize: 34,
        showSelectedLabels: false,
        selectedItemColor: Colors.red,
        onTap: tiklama,
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_filled,
              ),
              label: '',
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
              ),
              label: '',
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.move_to_inbox_rounded),
              label: '',
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_brightness_rounded),
              label: '',
              backgroundColor: Colors.black),
        ]);
  }

  AppBar appBarMethod(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      leadingWidth: 34,
      leading: Iconify(
        IconParkOutline.menu_fold_one,
        color: Colors.white,
      ),
      centerTitle: true,
      title: Container(
        child: Image.asset(
          'assets/images/netflix_logo.png',
          fit: BoxFit.cover,
          width: 100,
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.person, size: 34, color: Colors.red),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ProfilePage()));
          },
        ),
      ],
    );
  }
}
