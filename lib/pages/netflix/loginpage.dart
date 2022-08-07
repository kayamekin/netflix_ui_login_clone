import 'package:flutter/material.dart';

class LoginPageNetflix extends StatefulWidget {
  const LoginPageNetflix({Key? key}) : super(key: key);

  @override
  State<LoginPageNetflix> createState() => _LoginPageNetflixState();
}

class _LoginPageNetflixState extends State<LoginPageNetflix> {
  late var size = MediaQuery.of(context).size;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Center(
              child: Container(
                child: Image.asset(
                  'assets/image/netflix_logo.png',
                  width: 300,
                ),
              ),
            ),
            Container(
              height: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Center(
                    child: Container(
                      width: 300,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white.withAlpha(240),
                                width: 2,
                              ),
                            ),
                            labelText: 'Email',
                            labelStyle:
                                TextStyle(color: Colors.white, fontSize: 22),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      width: 300,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 2),
                            ),
                            labelText: 'Password',
                            labelStyle: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: GoLogin(),
    );
  }
}

class GoLogin extends StatelessWidget {
  const GoLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            width: size.width / 2,
            height: 80,
            child: Center(
              child: Icon(Icons.arrow_back_ios),
            ),
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        Container(
          width: size.width / 2,
          height: 80,
          child: Center(
              child: Text(
            "Submit",
            style: TextStyle(
              color: Colors.white.withAlpha(200),
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          )),
          color: Color.fromARGB(255, 236, 45, 45),
        ),
      ],
    );
  }
}
