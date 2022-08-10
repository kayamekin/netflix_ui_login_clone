import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_3/profilepage/profile.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.movie),
          onPressed: () {},
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
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfilePage()));
            },
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Stack(children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width / 3 * 2.5,
                      decoration: BoxDecoration(
                        color: Colors.red.shade100,
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image:
                              AssetImage('assets/images/backgroundimage.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 3 * 2.5,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                            colors: [
                              Colors.transparent,
                              Colors.black,
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          )),
                    )
                  ]);
                }),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          iconSize: 34,
          showSelectedLabels: false,
          selectedItemColor: Colors.red,
          onTap: tiklama,
          currentIndex: currentIndex,
          items: [
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
          ]),
    );
  }
}
