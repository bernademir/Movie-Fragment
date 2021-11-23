import 'package:flutter/material.dart';
import 'package:movie_fragment/ui/widget/ContainerGradient.dart';

class FragmentView extends StatefulWidget {
  const FragmentView({Key? key}) : super(key: key);

  @override
  _FragmentViewState createState() => _FragmentViewState();
}

class _FragmentViewState extends State<FragmentView> {
  @override
  Widget build(BuildContext context) {
    return ContainerGradient.bgGradient(
      Scaffold(
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
