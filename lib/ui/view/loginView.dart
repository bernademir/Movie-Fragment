import 'package:flutter/material.dart';
import 'package:movie_fragment/ui/widget/ContainerGradient.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  LoginViewState createState() => LoginViewState();
}

class LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return ContainerGradient.bgGradient(
      Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text("Login Page"),
        backgroundColor: Colors.blue.shade900,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
                    width: 200,
                    height: 150,
                    child: Center(
                      child: Text(
                        "Uygulama Adı",
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      )
                    ),
                  ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Email'
                  ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Şifre',
                    hintText: 'Şifre'
                  )
              ),
            ),
            TextButton(
              onPressed: () => {},
              child: Text(
                'Şifremi Unuttum',
                style: TextStyle(color: Colors.blue.shade900, fontSize: 15),
              ),
            ),
            TextButton(
              onPressed: () => {},
              child: Text(
                'Hesabınız Yok Mu? Kaydol',
                style: TextStyle(color: Colors.blue.shade900, fontSize: 15)
              )
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue.shade900, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () => {},
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            
          ],
        ),
      ),
    )
    );
  }
}
