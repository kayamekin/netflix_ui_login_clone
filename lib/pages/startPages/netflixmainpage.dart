import 'dart:math';
import 'dart:io' show Platform, exit;
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/constant.dart';
import 'package:flutter_application_3/profilepage/profile.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/icon_park_outline.dart';

class UIMovieMain extends StatefulWidget {
  const UIMovieMain({Key? key}) : super(key: key);
  static String routeMovieMain = "/netflixmainpage";

  @override
  State<UIMovieMain> createState() => _UIMovieMainState();
}

class _UIMovieMainState extends State<UIMovieMain> {
  int currentIndex = 0;
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

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

  void tiklama(int clickIndex) {
    setState(() {
      currentIndex = clickIndex;
    });
  }

  double _generateDouble2(double minValue, double maxValue, int precision) {
    final random = new Random();
    final doubleRandom = minValue + (maxValue - minValue) * random.nextDouble();
    return double.parse(doubleRandom.toStringAsFixed(precision));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showMyDialog();
        return shouldPop ?? false;
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          appBar: appBarMethod(context),
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                bannerMain(size, context),
                categoriesMovie,
                viewMovieSelect
              ],
            ),
          ),
          bottomNavigationBar: bottomBarUI(),
        ),
      ),
    );
  }

  Future<bool?> showMyDialog() => showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
            title: Text("Uygulamadan çıkmak istediğine emin misin"),
            actions: [
              TextButton(
                child: Text("Çık"),
                onPressed: () {
                  if (Platform.isAndroid) {
                    SystemNavigator.pop();
                  } else if (Platform.isIOS) {
                    exit(0);
                  }
                },
              ),
              TextButton(
                child: Text("Başa Dön"),
                onPressed: () => Navigator.pushNamed(context, '/'),
              ),
            ],
          ));

  Stack bannerMain(Size size, BuildContext context) {
    return Stack(children: [
      Container(
        width: size.width,
        height: size.height / 3 * 2,
        decoration: const BoxDecoration(
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
    ]);
  }

  Container get categoriesMovie {
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
            var size = MediaQuery.of(context).size;
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              margin: const EdgeInsets.all(20),
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

  Container get viewMovieSelect {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height / 2,
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: itemsDataImage.length,
        itemBuilder: (context, index) {
          Size size = MediaQuery.of(context).size;
          return Container(
            width: size.width * 0.50,
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(color: Colors.red.withAlpha(100)),
            child: Stack(
              children: [
                itemsDataImage[index],
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Colors.black12,
                      Colors.black,
                    ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                  ),
                ),
              ],
            ),
          );
        },
      ),
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
