import 'package:flutter/material.dart';
import 'package:movie_fragment/ui/view/homePageView.dart';
import 'package:movie_fragment/ui/view/movieDetailView.dart';
import 'package:movie_fragment/ui/view/loginView.dart';
import 'package:movie_fragment/ui/view/popularView.dart';
import 'package:movie_fragment/ui/view/profileView.dart';
import 'package:movie_fragment/ui/view/registerView.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: PopularView(),
    );
  }
}
