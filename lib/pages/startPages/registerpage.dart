import 'package:flutter/material.dart';
import 'package:flutter_application_3/pages/startPages/extractWidgetR_AND_L.dart';
import 'package:flutter_application_3/pages/startPages/loginpage.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class RegisterPageNetflix extends StatefulWidget {
  const RegisterPageNetflix({Key? key}) : super(key: key);
  static String routeRegister = "/registerpage";

  @override
  State<RegisterPageNetflix> createState() => _RegisterPageNetflixState();
}

class _RegisterPageNetflixState extends State<RegisterPageNetflix> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController _emailRegisterController;
  late TextEditingController _passwordRegisterController;
  late TextEditingController _passwordRepeatController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailRegisterController = TextEditingController();
    _passwordRegisterController = TextEditingController();
    _passwordRepeatController = TextEditingController();
  }

  @override
  void dispose() {
    _emailRegisterController.dispose();
    _passwordRegisterController.dispose();
    _passwordRepeatController.dispose();
    super.dispose();
  }

  late var size = MediaQuery.of(context).size;
  Text passwordProblem =
      const Text("Parolamı Unuttum !", style: TextStyle(color: Colors.white24));
  Text havingProblems = const Text("Bir Problem Yaşıyorum !",
      style: TextStyle(color: Colors.white24));

  @override
  Widget build(BuildContext context) {
    Image imageNetflixLogo = Image.asset(
      "assets/images/netflix_logo.png",
      width: size.width * 0.70,
    );
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeAreaBody(imageNetflixLogo, context),
      ),
    );
  }

  // -----------------------
  // SafeArea body
  // -----------------------
  Center SafeAreaBody(Image imageNetflixLogo, BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            imageNetflixLogo,
            inputLoginEmailAndPass,
            FittedBox(child: problemAndHavingButtons),
            FittedBox(child: buttonsDesign),
            facebookAndGmailRegister,
          ],
        ),
      ),
    );
  }

  // -----------------------
  // buttonDesignRow
  // -----------------------
  Row get buttonsDesign {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buttonGirisYap,
        SizedBox(
          width: size.width * 0.05,
        ),
        registerButton,
      ],
    );
  }

  SizedBox get facebookAndGmailRegister {
    return SizedBox(
      width: size.width / 2,
      height: size.height * 0.12,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/images/facebook_logo.png',
            width: size.width * 0.10,
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: size.width * 0.04,
          ),
          Image.asset(
            'assets/images/google_logo.png',
            width: size.width * 0.10,
            fit: BoxFit.cover,
          )
        ],
      ),
    );
  }

  // -----------------------
  // problem and Having Buttons
  // -----------------------
  SizedBox get problemAndHavingButtons {
    return SizedBox(
      height: size.height * 0.12,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextButton(
            child: havingProblems,
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  // -----------------------
  // loginButton
  // -----------------------
  GestureDetector get buttonGirisYap {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, LoginPageNetflix.routeLogin);
      },
      child: Container(
          width: size.width / 3 * 1,
          height: size.height * 0.08,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              "Girişe dön",
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(color: Colors.white, fontWeight: FontWeight.w700),
            ),
          )),
    );
  }

  // -----------------------
  // RegisterButton
  // -----------------------
  GestureDetector get registerButton {
    return GestureDetector(
      onTap: () {
        // kayıt olduktan sonra giriş yapması için tekrardan login sayfasına yönlendirme yapılmaktadır.
        Navigator.pushReplacementNamed(context, LoginPageNetflix.routeLogin);
      },
      child: Container(
          width: size.width / 3 * 1,
          height: size.height * 0.08,
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(
                color: Colors.red, width: 3, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              "Kayıt Ol",
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(color: Colors.white, fontWeight: FontWeight.w700),
            ),
          )),
    );
  }

  // -----------------------
  // inputLoginEmailAndPass
  // -----------------------
  SizedBox get inputLoginEmailAndPass {
    return SizedBox(
      width: size.width * 0.80,
      child: FormWidgetRegister(
        formKey: formKey,
        emailController: _emailRegisterController,
        size: size,
        passwordRegisterController: _passwordRegisterController,
        passwordRepeatController: _passwordRepeatController,
      ),
    );
  }
}
