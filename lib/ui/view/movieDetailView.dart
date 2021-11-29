import 'package:flutter/material.dart';
import 'package:movie_fragment/ui/widget/ContainerGradient.dart';

class MovieDetailView extends StatefulWidget {
  const MovieDetailView({Key? key}) : super(key: key);

  @override
  _MovieDetailViewState createState() => _MovieDetailViewState();
}

class _MovieDetailViewState extends State<MovieDetailView> {
  @override
  var movieName = "Movie Name";
  var description =
      "Frank Herbert'in bilim kurgu romanının, galaksideki en değerli varlığın ve en hayati unsurun korunmasıyla görevlendirilen asil bir ailenin oğlu hakkında uzun metrajlı uyarlaması.";
  var rate = 3;
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    Color containerColor = Color(0xff112d60);
    Color categoryNameColor = Color(0xffB6C0C5);
    return ContainerGradient.bgGradient(
      Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
              child: Column(children: <Widget>[
                Stack(
                 children: [
                 Padding(
                   padding: const EdgeInsets.only(top: 24.0),
                   child: Center(
                     child: Container(
                       height: 360,
                       alignment: FractionalOffset.center,
                       decoration: new BoxDecoration(
                           image: new DecorationImage(
                               image: new NetworkImage(
                                   "https://cdn1.ntv.com.tr/gorsel/e8opKTVsvECYVY5-4m0s-g.jpg?width=700&height=875&mode=crop&scale=both&v=20190630072843775"),
                               fit: BoxFit.fitWidth)),
                     ),
                   ),
                 ),
                 Positioned(
                     top: 345,
                     child: Container(
                       width: _width,
                       height: 60,
                       color: Colors.black.withOpacity(0.7),
                     )),
                 for (var i = 0; i < 5; i++) 
                   if(rate > i)
                     _star(context, true, 30.0 + (i * 45))
                   else
                     _star(context, false, 30.0 + (i * 45))
               ]),
                   Container(
                     margin: EdgeInsets.only(top: 10.0),
                     child: _divider(context, 15.0)
                   ),
                   _title(context, movieName),
                   _movieDescription(context),
                   _divider(context, 25.0),
                   _title(context, "Fragmanlar")
              ]
              )
          )
      ),
    );
  }

  _star(BuildContext context, bool rating, var left) {
    if (rating)
      return Positioned(
          top: 350,
          left: left,
          child: Image(
            image: AssetImage('design/stars.png'),
            color: Colors.yellow,
            height: 30,
          ));
    else
      return Positioned(
          top: 350,
          left: left,
          child: Image(
            image: AssetImage('design/stars.png'),
            color: Colors.white,
            height: 30,
          ));
  }

  _divider(BuildContext context, var height) {
    return Divider(
      color: Colors.white.withOpacity(0.7),
      height: height,
      thickness: 2,
      indent: 11,
      endIndent: 11,
    );
  }

  _title(BuildContext context, var text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0, bottom: 0.0),
        child: Text(
          text,
          style: Theme.of(context).textTheme.subtitle1!.copyWith(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  _movieDescription(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0, bottom: 0.0),
        child: Text(
          description,
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
