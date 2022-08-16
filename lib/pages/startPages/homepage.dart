import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_3/pages/startPages/loginpage.dart';
import 'package:auto_size_text/auto_size_text.dart';

class NetflixHomePage extends StatefulWidget {
  const NetflixHomePage({Key? key}) : super(key: key);
  static String routeHome = '/';
  static String centerWelcomeText =
      "Keyif alarak izleyeceğiniz en kapsamlı film , dizi arşivi olan Netflix'in Dünyasına Hoşgeldiniz";

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
    return TweenAnimationBuilders(size: size);
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
        child: Stack(children: [
          imageBackground,
          appIntroStartDesign(context),
        ]));
  }

  Column appIntroStartDesign(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          flex: 2,
          child: Center(
            child: imagesLogo,
          ),
        ),
        SizedBox(
          width: size.width / 3 * 2,
          child: AutoSizeText(
            NetflixHomePage.centerWelcomeText,
            style: TextStyle(
              fontSize: 48,
              color: Colors.white.withAlpha(200),
              fontWeight: FontWeight.bold,
            ),
            maxLines: 4,
          ),
        ),
        Expanded(
          child: Divider(
            color: Colors.red.shade200,
            height: 4,
            indent: size.width / 6,
            endIndent: size.width / 6,
            thickness: 2,
          ),
        ),
        Expanded(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: SizedBox(
              width: size.width * 0.50,
              height: size.height * 0.10,
              child: goButton(context),
            ),
          ),
        ),
      ],
    );
  }

  Container get imageBackground {
    return Container(
      width: size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/netflixwall.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  ElevatedButton goButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushReplacementNamed(context, LoginPageNetflix.routeLogin);
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.red,
        textStyle: const TextStyle(fontSize: 24),
      ),
      child: const Text("Başla"),
    );
  }

  Image get imagesLogo {
    return Image.asset(
      'assets/images/netflix_logo.png',
      width: size.width * 0.50,
    );
  }
}
