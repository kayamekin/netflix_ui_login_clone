import 'package:flutter/material.dart';
import 'package:flutter_application_3/pages/startPages/homepage.dart';
import 'package:flutter_application_3/pages/startPages/loginpage.dart';
import 'package:flutter_application_3/pages/startPages/netflixmainpage.dart';
import 'package:flutter_application_3/pages/startPages/registerpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Netflix UI Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const NetflixHomePage(),
      routes: {
        LoginPageNetflix.routeLogin: (context) => const LoginPageNetflix(),
        RegisterPageNetflix.routeRegister: (context) =>
            const RegisterPageNetflix(),
        UIMovieMain.routeMovieMain: (context) => const UIMovieMain(),
      },
    );
  }
}
