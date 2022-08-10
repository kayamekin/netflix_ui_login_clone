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
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: appBarMethod(context),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
                child: Container(
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 12,
                  itemBuilder: (context, index) {
                    return containermoviehorizontal();
                  }),
            )),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) => Container(
                  width: size.width,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ],
        ),
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

  Container containermoviehorizontal() {
    return Container(
      width: 150,
      height: 200,
      margin: EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        color: Colors.orange.shade100,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Text(
              "most favorites",
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }

  AppBar appBarMethod(BuildContext context) {
    return AppBar(
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
    );
  }
}
