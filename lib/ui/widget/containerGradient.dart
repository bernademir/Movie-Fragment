import 'package:flutter/material.dart';

class ContainerGradient extends StatelessWidget {
  const ContainerGradient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return bgGradient(Scaffold());
  }

  static bgGradient(Scaffold scaffold) {
    Color gc1 = Color(0xff112d60);
    Color gc2 = Color(0xffb6c0c5);
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [gc1, gc2],
        ),
      ),
      child: scaffold,
    );
  }
}
