import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_3/pages/startPages/netflixmainpage.dart';

class NetflixHomePage extends StatefulWidget {
  const NetflixHomePage({Key? key}) : super(key: key);

  @override
  State<NetflixHomePage> createState() => _NetflixHomePageState();
}

class _NetflixHomePageState extends State<NetflixHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  TextEditingController userInputController = TextEditingController();

  bool selected = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(children: [
        Containers(size: size),
      ]),
    );
  }
}

class Containers extends StatelessWidget {
  const Containers({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/netflixwall.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: TweenAnimationBuilders(size: size),
    );
  }
}

class TweenAnimationBuilders extends StatelessWidget {
  const TweenAnimationBuilders({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: 1),
        curve: Curves.bounceIn,
        duration: Duration(seconds: 4),
        builder: (BuildContext context, double val, child) {
          return Opacity(
            opacity: val,
            child: child,
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(
              child: Image.asset(
                'assets/images/netflix_logo.png',
                width: size.width * 0.50,
              ),
            ),
            SizedBox(
              width: size.width * 0.50,
              height: size.height * 0.10,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/loginpage');
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  textStyle: const TextStyle(fontSize: 24),
                ),
                child: const Text("Başla"),
              ),
            ),
          ],
        ));
  }
}
