import 'package:flutter/material.dart';
import 'package:movie_fragment/ui/widget/ContainerGradient.dart';
import 'package:movie_fragment/ui/widget/floatAppBar.dart';

class PopularView extends StatefulWidget {
  const PopularView({Key? key}) : super(key: key);

  @override
  _PopularViewState createState() => _PopularViewState();
}

Color color1 = Color(0xff112d60);
Color color2 = Color(0xffB6C0C5);

class _PopularViewState extends State<PopularView> {
  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    var _inset = 50.0;

    return ContainerGradient.bgGradient(
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: FloatAppBar(),
        body: SingleChildScrollView(
          child: Container(
            width: _width,
            margin: const EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Stack(
                  children: [
                    Text(
                      "Popüler",
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(color: Colors.white),
                    ),
                    for (int i = 0; i < 5; i++)
                      _movieListItem(
                          context, _width, _inset + i * 50.0 + i * 120.0)
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

_movieListItem(BuildContext context, _width, _inset) {
  return Container(
    margin: EdgeInsets.only(top: _inset),
    height: 120,
    color: Colors.transparent,
    child: new Container(
      decoration: new BoxDecoration(
        color: color1.withOpacity(0.7),
        borderRadius: BorderRadius.circular(15),
      ),
      child: _infoArea(context),
    ),
  );
}

_movieImage(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(left: 25),
    width: 97,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      image: new DecorationImage(
          image: new NetworkImage(
              "https://cdn1.ntv.com.tr/gorsel/e8opKTVsvECYVY5-4m0s-g.jpg?width=700&height=875&mode=crop&scale=both&v=20190630072843775"),
          fit: BoxFit.fitWidth),
    ),
  );
}

_infoArea(BuildContext context) {
  return Row(
    children: [
      _movieImage(context),
      Stack(
        children: <Widget>[
          _movieName(context),
          _starRating(context),
          _yonetmen(context)
        ],
      ),
    ],
  );
}

_movieName(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(left: 10, top: 15),
    child: Text(
      "Movie Name",
      style:
          Theme.of(context).textTheme.headline6!.copyWith(color: Colors.white),
    ),
  );
}

_yonetmen(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(left: 10, top: 38),
    child: Text(
      "Yönetmen: Alexandre Aja",
      style: Theme.of(context).textTheme.subtitle1!.copyWith(
          color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
    ),
  );
}

_starRating(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(left: 10, top: 55),
    child: Column(
      children: [
        _star(context),
        Text(
          "",
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(color: Colors.white),
        )
      ],
    ),
  );
}

_star(BuildContext context) {
  return Image(
    image: AssetImage('design/stars.png'),
    color: Colors.yellow,
    height: 20,
  );
}
