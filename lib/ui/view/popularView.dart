import 'package:flutter/material.dart';

import 'package:movie_fragment/ui/view/movieDetailView.dart';
import 'package:movie_fragment/ui/widget/ContainerGradient.dart';
import 'package:movie_fragment/ui/widget/floatAppBar.dart';

class PopularView extends StatefulWidget {
  List popularMovies;
  List mostRecentMovies;
  PopularView({
    Key? key,
    required this.popularMovies,
    required this.mostRecentMovies,
  }) : super(key: key);

  @override
  _PopularViewState createState() =>
      _PopularViewState(popularMovies, mostRecentMovies);
}

Color color1 = Color(0xff112d60);
Color color2 = Color(0xffB6C0C5);

class _PopularViewState extends State<PopularView> {
  List popularMovies;
  List mostRecentMovies;
  _PopularViewState(this.popularMovies, this.mostRecentMovies);
  @override
  Widget build(BuildContext context) {
    return ContainerGradient.bgGradient(
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: FloatAppBar(popularMovies: popularMovies, mostRecentMovies: mostRecentMovies),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              SizedBox(height: 50.0),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  child: Text(
                    "Popüler",
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(color: Colors.white),
                  ),
                ),
              ),
              for (int i = 0; i < widget.popularMovies.length; i++)
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MovieDetailView(
                          popularMovies: widget.popularMovies,
                          mostRecentMovies: widget.mostRecentMovies,
                          index: i,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.all(8.0),
                    height: MediaQuery.of(context).size.height / 4,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                        color: color1.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              margin: EdgeInsets.all(0.0),
                              width: 97,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: new DecorationImage(
                                  image: new NetworkImage(
                                    'https://image.tmdb.org/t/p/original' +
                                        widget.popularMovies[i]['poster_path']
                                            .toString(),
                                  ),
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Column(
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    margin: EdgeInsets.only(left: 10, top: 15),
                                    child: Text(
                                      widget.popularMovies[i]['original_title'],
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6!
                                          .copyWith(color: Colors.white),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    margin: EdgeInsets.only(left: 10, top: 55),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                        ),
                                        Text(
                                          widget.popularMovies[i]
                                                      ['vote_average']
                                                  .toString() +
                                              "/10",
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1!
                                              .copyWith(color: Colors.white),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
