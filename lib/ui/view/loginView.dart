import 'package:flutter/material.dart';
import 'package:movie_fragment/ui/widget/ContainerGradient.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  LoginViewState createState() => LoginViewState();
}

class LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController sifreController = TextEditingController();
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
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 3,
                    child: Center(
                      child: Text(
                        "Uygulama Adı",
                        style: Theme.of(context)
                            .textTheme
                            .headline4!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    labelText: 'Email',
                    hintText: 'Email',
                    hintStyle: TextStyle(color: hintColor),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
                child: TextField(
                  controller: sifreController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    labelText: 'Şifre',
                    hintText: 'Şifre',
                    hintStyle: TextStyle(color: hintColor),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(15),
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: mainColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextButton(
                  onPressed: () => {},
                  child: Text(
                    'Giriş'.toUpperCase(),
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(color: Colors.white),
                  ),
                ),
              ),
              TextButton(
                onPressed: () => {},
                child: Text(
                  'Şifremi Unuttum',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: mainColor),
                ),
              ),
              TextButton(
                onPressed: () => {},
                child: Text(
                  'Hesabınız Yok Mu? Kaydol',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: mainColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
