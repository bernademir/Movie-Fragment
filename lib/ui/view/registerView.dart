import 'package:flutter/material.dart';
import 'package:movie_fragment/ui/widget/ContainerGradient.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
   @override
  Widget build(BuildContext context) {
    return ContainerGradient.bgGradient(
      Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text("Register Page"),
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
                    labelText: 'Kullanıcı Adı',
                    hintText: 'Kullanıcı Adı'
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
                    labelText: 'Email',
                    hintText: 'Email'
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 20),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Şifre',
                    hintText: 'Şifre'
                  )
              ),
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue.shade900, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () => {},
                child: Text(
                  'Kaydol',
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
