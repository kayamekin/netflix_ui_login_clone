import 'package:flutter/material.dart';
import 'package:flutter_application_3/pages/startPages/extractWidgetR_AND_L.dart';
import 'package:flutter_application_3/pages/startPages/netflixmainpage.dart';
import 'package:flutter_application_3/pages/startPages/registerpage.dart';

class LoginPageNetflix extends StatefulWidget {
  const LoginPageNetflix({Key? key}) : super(key: key);
  static String routeLogin = "/loginPage";

  @override
  State<LoginPageNetflix> createState() => _LoginPageNetflixState();
}

class _LoginPageNetflixState extends State<LoginPageNetflix> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  late var size = MediaQuery.of(context).size;
  Text passwordProblem =
      const Text("Parolamı Unuttum !", style: TextStyle(color: Colors.white24));

  Text havingProblems = const Text("Bir Problem Yaşıyorum !",
      style: TextStyle(color: Colors.white24));

  @override
  Widget build(BuildContext context) {
    // -----------------------
    // image Netflix Logo
    // -----------------------

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

  Center SafeAreaBody(Image imageNetflixLogo, BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
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

  SizedBox get inputLoginEmailAndPass {
    return SizedBox(
      width: size.width * 0.80,
      child: FormWidgetLogin(
          formKey: formKey,
          emailController: _emailController,
          size: size,
          passwordController: _passwordController),
    );
  }

  Row get buttonsDesign {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        registerButton,
        SizedBox(
          width: size.width * 0.05,
        ),
        buttonGirisYap,
      ],
    );
  }

  SizedBox get problemAndHavingButtons {
    return SizedBox(
      height: size.height * 0.12,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextButton(
            child: passwordProblem,
            onPressed: () {},
          ),
          TextButton(
            child: havingProblems,
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  SizedBox get facebookAndGmailRegister {
    var image = Image.asset(
      'assets/images/facebook_logo.png',
      width: size.width * 0.10,
      fit: BoxFit.cover,
    );
    var verticalDivider = VerticalDivider(
      indent: 20,
      endIndent: 20,
      width: 4,
      color: Colors.red.withAlpha(100),
      thickness: 4.0,
    );
    String text1 = 'Google veya Facebook';
    String text2 = 'İle Giriş Yap';
    return SizedBox(
      width: size.width / 3 * 2,
      height: size.height * 0.12,
      child: Expanded(
        flex: 2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            image,
            verticalDivider,
            Image.asset(
              'assets/images/google_logo.png',
              width: size.width * 0.1,
              fit: BoxFit.cover,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text1,
                  style: const TextStyle(color: Colors.white),
                ),
                Text(
                  text2,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  GestureDetector get registerButton {
    String registerButtonText = "Kayıt Ol";
    return GestureDetector(
      onTap: () {
        Navigator.pushNamedAndRemoveUntil(context,
            RegisterPageNetflix.routeRegister, ModalRoute.withName('/'));
        setState(() {
          _emailController.clear();
        });
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
              registerButtonText,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(color: Colors.white, fontWeight: FontWeight.w700),
            ),
          )),
    );
  }

  GestureDetector get buttonGirisYap {
    String loginButtonText = "Giriş";
    return GestureDetector(
      onTap: () {
        Navigator.pushNamedAndRemoveUntil(context, UIMovieMain.routeMovieMain,
            ModalRoute.withName(UIMovieMain.routeMovieMain));
        setState(() {
          _emailController.clear();
        });
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
              loginButtonText,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(color: Colors.white, fontWeight: FontWeight.w700),
            ),
          )),
    );
  }
}
