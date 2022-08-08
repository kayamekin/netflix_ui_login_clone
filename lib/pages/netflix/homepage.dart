import 'package:flutter/material.dart';
import 'package:netflix_ui_design/pages/netflix/loginpage.dart';

class NetflixHomePage extends StatefulWidget {
  const NetflixHomePage({Key? key}) : super(key: key);

  @override
  State<NetflixHomePage> createState() => _NetflixHomePageState();
}

class _NetflixHomePageState extends State<NetflixHomePage> {
  late var size = MediaQuery.of(context).size;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
            child: Expanded(
          child: Stack(
            children: [
              BackgroundAndLogoStyle(),
              LoginPageRouteButton(context),
            ],
          ),
        )),
      ),
    );
  }

  Stack BackgroundAndLogoStyle() {
    return Stack(
      children: [
        Container(
          width: size.height - 80,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Expanded(
                    child: Container(
                      height: size.height,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/image/backgroundimage.jpg',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: size.height,
                    color: Colors.black.withAlpha(120),
                  ),
                  Container(
                    height: size.height,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xff030303).withOpacity(0.85),
                          Color(0xff030303).withOpacity(0)
                        ],
                        end: Alignment.topCenter,
                        begin: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Column(
          children: [
            SizedBox(
              height: 250,
            ),
            Center(
              child: Image.asset(
                'assets/image/netflix_logo.png',
                fit: BoxFit.cover,
                width: size.width / 3 * 2,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Column LoginPageRouteButton(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 400),
        Center(
          child: GestureDetector(
            onTap: () {
              setState(() {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => LoginPageNetflix()));
              });
            },
            child: Stack(children: [
              // Container(
              //   height: 150,
              //   width: size.width / 3 * 2,
              //   decoration: BoxDecoration(
              //       color: Colors.red.shade500,
              //       boxShadow: [
              //         BoxShadow(
              //           color: Colors.red.withAlpha(40),
              //           offset: Offset(0, 32),
              //           blurRadius: 32.0,
              //           spreadRadius: 32,
              //         ),
              //       ],
              //       borderRadius: BorderRadius.only(
              //         bottomRight: Radius.circular(10),
              //         bottomLeft: Radius.circular(10),
              //       )),
              // ),
              Container(
                width: size.width / 3 * 2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  gradient: LinearGradient(colors: [
                    Colors.black.withAlpha(200),
                    Colors.white.withAlpha(0),
                  ], end: Alignment.topRight, begin: Alignment.bottomLeft),
                ),
                height: 150,
              ),
              Container(
                height: 120,
                width: size.width / 3 * 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Go to Login",
                      style: TextStyle(color: Colors.white, fontSize: 32),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Touch Me",
                      style: TextStyle(
                          color: Colors.white.withAlpha(180), fontSize: 20),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ],
    );
  }
}
