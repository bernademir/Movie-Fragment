import 'package:flutter/material.dart';

import 'package:movie_fragment/ui/widget/ContainerGradient.dart';

class MovieDetailView extends StatefulWidget {
  List popularMovies;
  List mostRecentMovies;
  int index;
  MovieDetailView({
    Key? key,
    required this.popularMovies,
    required this.mostRecentMovies,
    required this.index,
  }) : super(key: key);

  @override
  _MovieDetailViewState createState() =>
      _MovieDetailViewState(popularMovies, mostRecentMovies, index);
}

class _MovieDetailViewState extends State<MovieDetailView> {
  List popularMovies;
  List mostRecentMovies;
  int index;

  _MovieDetailViewState(this.popularMovies, this.mostRecentMovies, this.index);

  Widget build(BuildContext context) {
    var rate = 3; //tiklanmaya gore verilecek
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
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              Stack(
                children: [
                  _movieImage(context),
                  Positioned(
                    top: MediaQuery.of(context).size.height / 2 - 50,
                    child: Container(
                      width: _width,
                      height: 50,
                      color: Colors.black.withOpacity(0.5),
                      child: Row(
                        children: [
                          for (var i = 0; i < 5; i++)
                            if (rate > i)
                              _star(context, true, 30.0 + (i * 45))
                            else
                              _star(context, false, 30.0 + (i * 45)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  _popularityText(_width, context),
                  _rateText(_width, context),
                  _voteText(_width, context),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 10.0),
                child: _divider(context, 15.0),
              ),
              _movieTitle(context),
              _movieOverview(context),
              _divider(context, 25.0),
              _fragmentTitle(context, "Fragmanlar")
            ],
          ),
        ),
      ),
    );
  }

  _movieOverview(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0, bottom: 0.0),
        child: Text(
          widget.popularMovies[widget.index]['overview'],
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(color: Colors.white),
        ),
      ),
    );
  }

  _movieTitle(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0, bottom: 0.0),
        child: Text(
          widget.popularMovies[widget.index]['original_title'],
          style: Theme.of(context).textTheme.subtitle1!.copyWith(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  _voteText(double _width, BuildContext context) {
    return Column(
      children: [
        // Popülerlik puanı
        Container(
          height: 20,
          width: _width / 3,
          margin: const EdgeInsets.only(top: 20.0),
          child: Text(
            widget.popularMovies[widget.index]['vote_count'].toString(),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                color: Colors.blue[900],
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: 30,
          width: _width / 3,
          child: Text(
            "Sayılan Oy",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  _rateText(double _width, BuildContext context) {
    return Column(
      children: [
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
                widget.popularMovies[widget.index]['vote_average'].toString(),
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
                      fontWeight: FontWeight.bold,
                    ),
              )
            ],
          ),
        )
      ],
    );
  }

  _popularityText(double _width, BuildContext context) {
    return Column(
      children: [
        // Popülerlik puanı
        Container(
          height: 20,
          width: _width / 3,
          margin: const EdgeInsets.only(top: 20.0),
          child: Text(
            widget.popularMovies[widget.index]['popularity'].toString(),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                color: Colors.green, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: 30,
          width: _width / 3,
          child: Text(
            "Popülerlik",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  _movieImage(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      alignment: FractionalOffset.center,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
              'https://image.tmdb.org/t/p/original' +
                  widget.popularMovies[widget.index]['poster_path'].toString(),
            ),
            fit: BoxFit.fitWidth),
      ),
    );
  }

  _star(BuildContext context, bool rating, var left) {
    if (rating)
      return Image(
        image: AssetImage('design/stars.png'),
        color: Colors.yellow,
        height: 30,
      );
    else
      return Image(
        image: AssetImage('design/stars.png'),
        color: Colors.white,
        height: 30,
      );
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

  _fragmentTitle(BuildContext context, var text) {
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
}
