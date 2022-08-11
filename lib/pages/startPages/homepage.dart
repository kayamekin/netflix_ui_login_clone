import 'package:flutter/material.dart';
import 'package:flutter_application_3/pages/startPages/loginpage.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bi.dart';

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
              Positioned(
                top: 400,
                left: MediaQuery.of(context).size.width / 7,
                child: SizedBox(
                  width: 300,
                  height: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shadowColor: Colors.white30,
                        primary: Colors.red.withAlpha(120),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "HADİ BAŞLA",
                            style: TextStyle(fontSize: 24),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Iconify(
                                Bi.film,
                                color: Colors.white30,
                              ),
                              Iconify(
                                Bi.file_medical,
                                color: Colors.white30,
                              ),
                              Iconify(
                                Bi.activity,
                                color: Colors.white30,
                              ),
                              Iconify(
                                Bi.filetype_m4p,
                                color: Colors.white30,
                              ),
                            ],
                          ),
                        ],
                      ),
                      onPressed: () {
                        setState(() {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const LoginPageNetflix()));
                        });
                      },
                    ),
                  ),
                ),
              )
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
