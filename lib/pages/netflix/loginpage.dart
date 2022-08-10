import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class LoginPageNetflix extends StatefulWidget {
  const LoginPageNetflix({Key? key}) : super(key: key);

  @override
  State<LoginPageNetflix> createState() => _LoginPageNetflixState();
}

class _LoginPageNetflixState extends State<LoginPageNetflix> {
  late var size = MediaQuery.of(context).size;

  VideoPlayerController videoPlayerController =
      VideoPlayerController.asset('assets/videos/netflix_intro.mp4');
  ChewieController? chewieController;

  @override
  void initState() {
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      aspectRatio: 12 / 24,
      autoPlay: true,
      looping: true,
      autoInitialize: true,
      showControls: false,
      allowMuting: false,
    );
    super.initState();
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController!.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(
            children: [
              Container(
                height: size.height,
                child: Chewie(
                  controller: chewieController!,
                ),
              ),
              Container(
                color: Colors.black54,
                width: double.infinity,
                height: size.height,
              ),
              Positioned(
                top: 200,
                width: MediaQuery.of(context).size.width,
                child: Material(
                  color: Colors.transparent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Center(
                        child: Container(
                          child: Image.asset(
                            'assets/image/netflix_logo.png',
                            width: size.height / 3,
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
                                      labelStyle: TextStyle(
                                          color: Colors.white, fontSize: 22),
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
                                      fillColor: Colors.transparent,
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.white, width: 2),
                                      ),
                                      labelText: 'Password',
                                      labelStyle:
                                          TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Container(
                      //     width: double.infinity,
                      //     height: size.height - 120,
                      //     child: GoLogin()),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
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
          child: Expanded(
            flex: 1,
            child: Container(
              width: size.width / 2,
              height: 80,
              child: Center(
                child: Icon(Icons.arrow_back_ios),
              ),
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
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
        ),
      ],
    );
  }
}
