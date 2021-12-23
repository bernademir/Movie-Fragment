import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../widget/ContainerGradient.dart';
import 'homePageView.dart';
import 'registerView.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  LoginViewState createState() => LoginViewState();
}

class LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    Color mainColor = Color(0xff112d60);
    Color hintColor = Color(0xffB6C0C5);
    return ContainerGradient.bgGradient(
      Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _uygulamaAdi(context, "FilmKolik"),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _emailTextField(hintColor),
                    _passwordTextField(hintColor),
                  ],
                ),
              ),
              _signInButton(context, mainColor),
              _registerNavText(context, mainColor),
            ],
          ),
        ),
      ),
    );
  }

  _registerNavText(BuildContext context, Color mainColor) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Hesabınız Yok Mu?',
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: mainColor),
          ),
          TextSpan(
            text: 'Kaydol',
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: mainColor,
                  decoration: TextDecoration.underline,
                ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegisterView(),
                  ),
                );
              },
          ),
        ],
      ),
    );
  }

  _signInButton(BuildContext context, Color mainColor) {
    return Container(
      margin: EdgeInsets.all(15),
      height: 50,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: mainColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () {
          signIn(emailController.text, passwordController.text);
        },
        child: Center(
          child: Text(
            'Giriş'.toUpperCase(),
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }

  _passwordTextField(Color hintColor) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),
      child: TextFormField(
        autofocus: false,
        validator: (value) {
          RegExp regex = new RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return ("Lütfen şifrenizi giriniz.");
          }
          if (!regex.hasMatch(value)) {
            return ("Lütfen geçerli bir şifre giriniz.(Min. 6 karakter)");
          }
        },
        onSaved: (value) {
          passwordController.text = value!;
        },
        textInputAction: TextInputAction.done,
        controller: passwordController,
        obscureText: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          hintText: 'Şifre',
          hintStyle: TextStyle(color: hintColor),
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    );
  }

  _emailTextField(Color hintColor) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: TextFormField(
        autofocus: false,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Lütfen email adresinizi giriniz.");
          }
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return ("Lütfen geçerli bir email adresi giriniz.");
          }
          return null;
        },
        onSaved: (value) {
          emailController.text = value!;
        },
        textInputAction: TextInputAction.next,
        controller: emailController,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          hintText: 'Email',
          hintStyle: TextStyle(color: hintColor),
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    );
  }

  _uygulamaAdi(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 60.0),
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 3,
          child: Center(
            child: Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _firebaseAuth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
                  Fluttertoast.showToast(msg: "Login Successful"),
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => HomePageView())),
                });
      } on FirebaseAuthException catch (e) {
        Fluttertoast.showToast(msg: e.code);
      }
    }
  }
}
