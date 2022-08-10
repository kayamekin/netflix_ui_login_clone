import 'package:flutter/material.dart';
import 'package:flutter_application_3/pages/startPages/netflixmainpage.dart';
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
      looping: false,
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
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
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
                      child: Image.asset(
                        'assets/images/netflix_logo.png',
                        width: size.height / 3,
                      ),
                    ),
                    InputDesigns(),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 600,
              width: MediaQuery.of(context).size.width,
              child: Material(
                color: Colors.white.withOpacity(0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      focusColor: Colors.white,
                      splashColor: Colors.white,
                      child: Ink(
                        width: MediaQuery.of(context).size.width / 2,
                        height: 50,
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                          colors: [
                            Colors.black,
                            Colors.red,
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        )),
                        child: const Center(
                          child: Text(
                            "BACK",
                            style:
                                TextStyle(color: Colors.white30, fontSize: 24),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => UIMovieMain(),
                        ));
                        print("okey good");
                      },
                      splashColor: Colors.red.shade300,
                      child: Ink(
                        width: MediaQuery.of(context).size.width / 2,
                        height: 50,
                        color: Colors.red,
                        child: const Center(
                          child: Text(
                            "SUBMIT",
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InputDesigns extends StatelessWidget {
  const InputDesigns({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Center(
            child: SizedBox(
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
                        const TextStyle(color: Colors.white, fontSize: 22),
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: SizedBox(
              width: 300,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    fillColor: Colors.transparent,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2),
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
    );
  }
}
