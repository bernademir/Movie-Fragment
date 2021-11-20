import 'package:flutter/material.dart';
import 'package:movie_fragment/ui/view/homePageView.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: HomePageView(),
    );
  }
}
