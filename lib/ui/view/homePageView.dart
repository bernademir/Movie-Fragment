import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../../core/service/movieService.dart';
import '../widget/ContainerGradient.dart';
import '../widget/floatAppBar.dart';
import 'movieDetailView.dart';
import 'popularView.dart';
import 'profileView.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  _HomePageViewState createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  List homePageTitles = ["En Yeniler", "Popülerler", "İncele"];

  List popularMovies = [];
  List mostRecentMovies = [];

  MovieService _service = MovieService();

  @override
  void initState() {
    loadMovies();
    super.initState();
  }

  loadMovies() async {
    TMDB tmdbWithCustomLogs =
        TMDB(ApiKeys(_service.apiKey, _service.readAccesstoken));

    Map popularResult = await tmdbWithCustomLogs.v3.movies.getPouplar();
    Map mostrecentResult = await tmdbWithCustomLogs.v3.movies.getNowPlaying();
    setState(() {
      popularMovies = popularResult['results'];
      mostRecentMovies = mostrecentResult['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    Color color1 = Color(0xff112d60);
    Color color2 = Color(0xffB6C0C5);
    return ContainerGradient.bgGradient(
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: FloatAppBar(
          popularMovies: popularMovies,
          mostRecentMovies: mostRecentMovies,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: color1,
          child: Icon(
            Icons.account_circle,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => ProfileView()));
          },
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(height: 40.0),
              _headline(context, homePageTitles, 0),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (var i = 0; i < mostRecentMovies.length; i++)
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MovieDetailView(
                                  resultList: mostRecentMovies, index: i),
                            ),
                          );
                        },
                        child: _mostRecentMovies(context, color1, i),
                      ),
                  ],
                ),
              ),
              SizedBox(height: 40.0),
              _headlineRow(context),
              Column(
                children: [
                  for (var i = 0; i < popularMovies.length; i++)
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MovieDetailView(
                              resultList: popularMovies,
                              index: i,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
                        height: MediaQuery.of(context).size.height / 3.2,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: color1.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: _popularMoviesImage(i),
                            ),
                            Expanded(
                              flex: 4,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  _movieNameText(i, context),
                                  _yearText(i, context),
                                  _popularityText(i, context, color2),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      ),
                                      _ratesText(i, context),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _popularMoviesImage(int i) {
    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 10.0,
      margin: EdgeInsets.all(0.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Image.network(
        'https://image.tmdb.org/t/p/original' +
            popularMovies[i]['poster_path'].toString(),
        fit: BoxFit.fill,
      ),
    );
  }

  _mostRecentMovies(BuildContext context, Color color1, int i) {
    return Container(
      margin: EdgeInsets.only(left: 10.0, right: 0.0, top: 0.0),
      height: MediaQuery.of(context).size.height / 3,
      width: MediaQuery.of(context).size.width / 3.5,
      decoration: BoxDecoration(
        color: color1.withOpacity(0.7),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 10,
            child: Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              elevation: 10.0,
              margin: EdgeInsets.all(0.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Image.network(
                'https://image.tmdb.org/t/p/original/' +
                    mostRecentMovies[i]['poster_path'].toString(),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              margin: EdgeInsets.all(5.0),
              child: Center(
                child: Text(
                  mostRecentMovies[i]['original_title'],
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _ratesText(int i, BuildContext context) {
    return Text(
      popularMovies[i]['vote_average'].toString() + "/10",
      style:
          Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.white),
    );
  }

  _popularityText(int i, BuildContext context, Color color2) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0, bottom: 0.0),
        child: Text(
          popularMovies[i]['popularity'].toString(),
          style: Theme.of(context).textTheme.subtitle1!.copyWith(color: color2),
        ),
      ),
    );
  }

  _yearText(int i, BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0, bottom: 0.0),
        child: Text(
          popularMovies[i]['release_date'],
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(color: Colors.white),
        ),
      ),
    );
  }

  _movieNameText(int i, BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin:
            EdgeInsets.only(left: 10.0, right: 10.0, top: 15.0, bottom: 0.0),
        child: Text(
          popularMovies[i]['original_title'],
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: Colors.white),
        ),
      ),
    );
  }

  _headlineRow(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: _headline(context, homePageTitles, 1),
        ),
        Expanded(
          flex: 1,
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: homePageTitles[2].toUpperCase(),
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                      decoration: TextDecoration.underline),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PopularView(
                              popularMovies: popularMovies,
                              mostRecentMovies: mostRecentMovies),
                        ),
                      );
                    },
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  _headline(BuildContext context, List list, int i) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.all(10.0),
        child: Text(
          list[i],
          style: Theme.of(context)
              .textTheme
              .headline5!
              .copyWith(color: Colors.white),
          textDirection: TextDirection.ltr,
        ),
      ),
    );
  }
}
