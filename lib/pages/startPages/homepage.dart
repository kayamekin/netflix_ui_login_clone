import 'package:flutter/material.dart';
import 'package:flutter_application_3/pages/startPages/loginpage.dart';

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
        SizedBox(
          width: size.height - 80,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Expanded(
                    child: Container(
                      height: size.height,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/backgroundimage.jpg',
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
                          const Color(0xff030303).withOpacity(0.85),
                          const Color(0xff030303).withOpacity(0)
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
            const SizedBox(
              height: 250,
            ),
            Center(
              child: Image.asset(
                'assets/images/netflix_logo.png',
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
        const SizedBox(height: 400),
        Center(
          child: GestureDetector(
            onTap: () {
              setState(() {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const LoginPageNetflix()));
              });
            },
            child: Stack(children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  width: size.width / 3 * 2,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withAlpha(0),
                        Colors.black.withAlpha(250),
                      ],
                      tileMode: TileMode.mirror,
                      begin: Alignment(0, 1),
                      end: Alignment.bottomLeft,
                    ),
                  ),
                  height: 150,
                ),
              ),
              SizedBox(
                height: 120,
                width: size.width / 3 * 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Go to Login",
                      style: TextStyle(color: Colors.white, fontSize: 32),
                    ),
                    Text(
                      "Touch Me",
                      style: TextStyle(
                          color: Colors.white.withAlpha(180), fontSize: 20),
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
