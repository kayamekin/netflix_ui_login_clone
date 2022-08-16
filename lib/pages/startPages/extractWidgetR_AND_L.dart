import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/pages/startPages/registerpage.dart';

class FormWidgetLogin extends StatelessWidget {
  const FormWidgetLogin({
    Key? key,
    required this.formKey,
    required TextEditingController emailController,
    required this.size,
    required TextEditingController passwordController,
  })  : _emailController = emailController,
        _passwordController = passwordController,
        super(key: key);

  final GlobalKey<FormState> formKey;
  final TextEditingController _emailController;
  final Size size;
  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.always,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          EmailWidget(emailController: _emailController),
          SizedBox(
            height: size.height * 0.01,
          ),
          PasswordWidget(passwordController: _passwordController),
        ],
      ),
    );
  }
}

class EmailWidget extends StatelessWidget {
  const EmailWidget({
    Key? key,
    required TextEditingController emailController,
  })  : _emailController = emailController,
        super(key: key);

  final TextEditingController _emailController;

  @override
  Widget build(BuildContext context) {
    var email = 'E-mail';
    return TextFormField(
      controller: _emailController,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress,
      cursorColor: Colors.red,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        errorStyle: TextStyle(
          color: Colors.red[400],
          fontWeight: FontWeight.bold,
          fontSize: 13,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 4, color: Colors.white24),
          borderRadius: BorderRadius.circular(30.0),
        ),
        labelText: email,
        labelStyle: TextStyle(
          color: Colors.white.withAlpha(150),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 4, color: Colors.white24),
          borderRadius: BorderRadius.circular(30.0),
        ),
        prefixIcon:
            Icon(Icons.email_outlined, color: Colors.white.withAlpha(150)),
      ),
      autofillHints: [AutofillHints.email],
      validator: (email) {
        var notEmail = 'Email Doğru Girilmedi';
        var successfulEmail = 'Email Doğru Yazılıyor !';
        return email != null && !EmailValidator.validate(email)
            ? notEmail
            : successfulEmail;
      },
    );
  }
}

class PasswordWidget extends StatelessWidget {
  const PasswordWidget({
    Key? key,
    required TextEditingController passwordController,
  })  : _passwordController = passwordController,
        super(key: key);

  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    var passText = 'Password';
    return TextFormField(
      controller: _passwordController,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.visiblePassword,
      obscureText: !RegisterPageNetflix.passwordSelected,
      cursorColor: Colors.red,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 3, color: Colors.white24),
          borderRadius: BorderRadius.circular(30.0),
        ),
        prefixIcon: Icon(Icons.lock_person_outlined,
            color: Colors.white.withAlpha(150)),
        labelText: 'Parola',
        labelStyle: TextStyle(
          color: Colors.white.withAlpha(150),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 3, color: Colors.white24),
          borderRadius: BorderRadius.circular(30.0),
        ),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              RegisterPageNetflix.passwordSelected =
                  !RegisterPageNetflix.passwordSelected;
            });
          },
          icon: ShowHidePassword(),
        ),
      ),
    );
  }

  void setState(Null Function() param0) {}
}

//

//

// --------------------------------------------------------------------------------
//
//  REGİSTER PAGE
// --------------------
//
class FormWidgetRegister extends StatelessWidget {
  const FormWidgetRegister({
    Key? key,
    required this.size,
    required this.formKey,
    required TextEditingController emailController,
    required TextEditingController passwordRegisterController,
    required TextEditingController passwordRepeatController,
  })  : _emailController = emailController,
        _passwordRegisterController = passwordRegisterController,
        _passwordRepeatController = passwordRepeatController,
        super(key: key);

  final Size size;
  final GlobalKey<FormState> formKey;
  final TextEditingController _emailController;
  final TextEditingController _passwordRegisterController;
  final TextEditingController _passwordRepeatController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.always,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UserNameWidget(),
          SizedBox(
            height: size.height * 0.01,
          ),
          EmailWidget(emailController: _emailController),
          SizedBox(
            height: size.height * 0.01,
          ),
          PasswordRegisterWidget(
              passwordRegisterController: _passwordRegisterController),
          SizedBox(
            height: size.height * 0.01,
          ),
          PasswordRepeatRegisterWidget(
              passwordRepeatController: _passwordRepeatController),
        ],
      ),
    );
  }
}
// ---------------------------------------------

class PasswordRegisterWidget extends StatelessWidget {
  const PasswordRegisterWidget({
    Key? key,
    required TextEditingController passwordRegisterController,
  })  : _passwordRegisterController = passwordRegisterController,
        super(key: key);

  final TextEditingController _passwordRegisterController;

  @override
  Widget build(BuildContext context) {
    var passText = 'Parola';
    return TextFormField(
      controller: _passwordRegisterController,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.visiblePassword,
      obscureText: !RegisterPageNetflix.passwordSelected,
      cursorColor: Colors.red,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 3, color: Colors.white24),
          borderRadius: BorderRadius.circular(30.0),
        ),
        prefixIcon: Icon(Icons.lock_person_outlined,
            color: Colors.white.withAlpha(150)),
        labelText: passText,
        labelStyle: TextStyle(
          color: Colors.white.withAlpha(150),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 3, color: Colors.white24),
          borderRadius: BorderRadius.circular(30.0),
        ),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              RegisterPageNetflix.passwordSelected =
                  !RegisterPageNetflix.passwordSelected;
            });
          },
          icon: ShowHidePassword(),
        ),
      ),
    );
  }

  void setState(Null Function() param0) {}
}

class PasswordRepeatRegisterWidget extends StatelessWidget {
  const PasswordRepeatRegisterWidget({
    Key? key,
    required TextEditingController passwordRepeatController,
  })  : _passwordRepeatController = passwordRepeatController,
        super(key: key);

  final TextEditingController _passwordRepeatController;

  @override
  Widget build(BuildContext context) {
    var passText = 'Parola tekrar';
    return TextFormField(
      controller: _passwordRepeatController,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.visiblePassword,
      obscureText: !RegisterPageNetflix.passwordSelected,
      cursorColor: Colors.red,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 3, color: Colors.white24),
          borderRadius: BorderRadius.circular(30.0),
        ),
        prefixIcon: Icon(Icons.lock_person_outlined,
            color: Colors.white.withAlpha(150)),
        labelText: passText,
        labelStyle: TextStyle(
          color: Colors.white.withAlpha(150),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 3, color: Colors.white24),
          borderRadius: BorderRadius.circular(30.0),
        ),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              RegisterPageNetflix.passwordSelected =
                  !RegisterPageNetflix.passwordSelected;
            });
          },
          icon: ShowHidePassword(),
        ),
      ),
    );
  }

  void setState(Null Function() param0) {}
}

class EmailRegisterWidget extends StatelessWidget {
  const EmailRegisterWidget({
    Key? key,
    required TextEditingController emailRegisterController,
  })  : _emailRegisterController = emailRegisterController,
        super(key: key);

  final TextEditingController _emailRegisterController;

  @override
  Widget build(BuildContext context) {
    var email = 'E-mail';
    return TextFormField(
      controller: _emailRegisterController,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress,
      cursorColor: Colors.red,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        errorStyle: TextStyle(
          color: Colors.red[400],
          fontWeight: FontWeight.bold,
          fontSize: 13,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 4, color: Colors.white24),
          borderRadius: BorderRadius.circular(30.0),
        ),
        labelText: email,
        labelStyle: TextStyle(
          color: Colors.white.withAlpha(150),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 4, color: Colors.white24),
          borderRadius: BorderRadius.circular(30.0),
        ),
        prefixIcon:
            Icon(Icons.email_outlined, color: Colors.white.withAlpha(150)),
      ),
      autofillHints: [AutofillHints.email],
      validator: (email) {
        var notEmail = 'Email Doğru Girilmedi';
        var successfulEmail = 'Email Doğru Yazılıyor !';
        return email != null && !EmailValidator.validate(email)
            ? notEmail
            : successfulEmail;
      },
    );
  }
}

// ----------------------------------------
// show hide
// ----------------------------------------

class ShowHidePassword extends StatelessWidget {
  const ShowHidePassword({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      RegisterPageNetflix.passwordSelected
          ? Icons.remove_red_eye
          : Icons.remove_red_eye_outlined,
      color: Colors.white,
    );
  }
}

class UserNameWidget extends StatelessWidget {
  const UserNameWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      autofocus: true,
      cursorColor: Colors.red,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 3, color: Colors.white24),
          borderRadius: BorderRadius.circular(30.0),
        ),
        prefixIcon:
            Icon(Icons.person_add_outlined, color: Colors.white.withAlpha(150)),
        labelText: 'Kullanıcı Adı',
        labelStyle: TextStyle(
          color: Colors.white.withAlpha(150),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 3, color: Colors.white24),
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
    );
  }
}
