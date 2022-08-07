import 'package:flutter/material.dart';
import 'package:netflix_ui_design/pages/netflix/loginpage.dart';

class NetflixHomePage extends StatefulWidget {
  const NetflixHomePage({Key? key}) : super(key: key);

  @override
  State<NetflixHomePage> createState() => _NetflixHomePageState();
}

class _NetflixHomePageState extends State<NetflixHomePage> {
  late var size = MediaQuery.of(context).size;
  double heightLoginButton = 700;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
          child: Stack(
        children: [
          Center(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => LoginPageNetflix()));
                });
              },
              child: Container(
                height: heightLoginButton,
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
                    )
                  ],
                ),
                decoration: BoxDecoration(
                    color: Colors.red.shade500,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.red.withAlpha(40),
                        offset: Offset(0, 32),
                        blurRadius: 32.0,
                        spreadRadius: 24,
                      ),
                    ],
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    )),
              ),
            ),
          ),
          Container(
              width: size.height - 80,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 500,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/image/backgroundimage.jpg',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        height: 500,
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
              )),
          Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Center(
                child: Image.asset(
                  'assets/image/netflix_logo.png',
                  fit: BoxFit.cover,
                  width: size.width / 2,
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
