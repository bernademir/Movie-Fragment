import 'package:flutter/material.dart';
import 'package:movie_fragment/ui/widget/ContainerGradient.dart';

class MovieDetailView extends StatefulWidget {
  const MovieDetailView({Key? key}) : super(key: key);

  @override
  _MovieDetailViewState createState() => _MovieDetailViewState();
}

class _MovieDetailViewState extends State<MovieDetailView> {
  var movieName = "Movie Name";
  var description =
      "Frank Herbert'in bilim kurgu romanının, galaksideki en değerli varlığın ve en hayati unsurun korunmasıyla görevlendirilen asil bir ailenin oğlu hakkında uzun metrajlı uyarlaması.";
  var rate = 3;
  var populerlik = 144.435;
  var onUzerinden = 8.3;
  var sayilanOy = 91;
  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    return ContainerGradient.bgGradient(
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(children: [
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
                  if (rate > i)
                    _star(context, true, 30.0 + (i * 45))
                  else
                    _star(context, false, 30.0 + (i * 45))
              ]),
              _pointArea(context, _width),
              Container(
                  margin: EdgeInsets.only(top: 10.0),
                  child: _divider(context, 15.0)),
              _title(context, movieName),
              _movieDescription(context),
              _divider(context, 25.0),
              _title(context, "Fragmanlar")
            ],
          ),
        ),
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
        ),
      );
    else
      return Positioned(
        top: 350,
        left: left,
        child: Image(
          image: AssetImage('design/stars.png'),
          color: Colors.white,
          height: 30,
        ),
      );
  }

  _pointArea(BuildContext context, _width) {
    return Row(children: [
      Column(children: [
        // Popülerlik puanı
        Container(
            height: 20,
            width: _width / 3,
            margin: const EdgeInsets.only(top: 20.0),
            child: Text(
              populerlik.toString(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: Colors.green,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            )),
        Container(
            height: 30,
            width: _width / 3,
            child: Text(
              "Popülerlik",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ))
      ]),
      Column(children: [
        // Yıldız Puanı
        Container(
            height: 24,
            width: _width / 3,
            margin: const EdgeInsets.only(top: 18.0),
            child: _star(context, true, _width / 6)),
        Container(
            height: 20,
            width: _width / 6,
            margin: const EdgeInsets.only(left: 2.0),
            child: Row(
              children: [
                Text(
                  onUzerinden.toString(),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  " / 10",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                )
              ],
            ))
      ]),
      Column(children: [
        // Popülerlik puanı
        Container(
            height: 20,
            width: _width / 3,
            margin: const EdgeInsets.only(top: 20.0),
            child: Text(
              sayilanOy.toString(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: Colors.blue[900],
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            )),
        Container(
            height: 30,
            width: _width / 3,
            child: Text(
              "Sayılan Oy",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ))
      ]),
    ]);
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

  // _videoPlayer(BuildContext context) {
  //   return Container();
  // }
}
