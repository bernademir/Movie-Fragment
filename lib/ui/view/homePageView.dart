import 'package:flutter/material.dart';
import 'package:movie_fragment/ui/widget/ContainerGradient.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  _HomePageViewState createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  Widget build(BuildContext context) {
    return ContainerGradient.bgGradient(
      Scaffold(),
    );
  }
}
