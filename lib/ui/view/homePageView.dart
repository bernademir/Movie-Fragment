import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../widget/ContainerGradient.dart';
import '../widget/floatAppBar.dart';
import 'profileView.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  _HomePageViewState createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {

  List homePageTitles = ["En Yeniler", "Popülerler", "İncele"];
  List category = [
    "category",
    "category",
    "category",
    "category",
    "category",
    "category"
  ];
  List popularmovies = [];
  List mostrecentmovies = [];
  final String apikey = "6a5f967b177a332b029fa552bd1f516a";
  final readaccesstoken = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2YTVmOTY3YjE3N2EzMzJiMDI5ZmE1NTJiZDFmNTE2YSIsInN1YiI6IjYxYmYwYmE5MDE0MzI1MDA0MzM0MDFiZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.-zRpMBo7cOxhJw3IllQr2xam83xvp2GWi5DFYv_i_hI";


  @override
  void initState(){
    loadmovies();
    super.initState();
  }

  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apikey, readaccesstoken));
    // api'dan gelen popüler ve en yeniler bu listelerde
    Map popularresult = await tmdbWithCustomLogs.v3.movies.getPouplar();
    Map mostrecentresult = await tmdbWithCustomLogs.v3.movies.getNowPlaying();
    setState(() {
      popularmovies = popularresult['results'];
      mostrecentmovies = mostrecentresult['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    Color color1 = Color(0xff112d60);
    Color color2 = Color(0xffB6C0C5);
    return ContainerGradient.bgGradient(
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: FloatAppBar(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: color1,
          child: Icon(
            Icons.account_circle,
            color: color2,
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
                    for (var i = 0;
                        i < 6;
                        i++) //apiden donen fotolar ve textler listeye atilip list.size kadar donecek
                      InkWell(
                        onTap: () {},
                        child: Container(
                          margin:
                              EdgeInsets.only(left: 10.0, right: 0.0, top: 0.0),
                          height: MediaQuery.of(context).size.height / 3.5,
                          width: MediaQuery.of(context).size.width / 3,
                          decoration: BoxDecoration(
                            color: color1.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                flex: 5,
                                child: Card(
                                  elevation: 10.0,
                                  margin: EdgeInsets.all(0.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Image.network(
                                    "https://cdn1.ntv.com.tr/gorsel/e8opKTVsvECYVY5-4m0s-g.jpg?width=700&height=875&mode=crop&scale=both&v=20190630072843775",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Center(
                                  child: Text(
                                    "film adi", //apiden donen text listden alinacak
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              SizedBox(height: 40.0),
              _headlineRow(context),
              Column(
                children: [
                  for (var i = 0;
                      i < 6;
                      i++) //apiden donen fotolar ve textler listeye atilip list.size kadar donecek
                    InkWell(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.only(
                            left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
                        height: MediaQuery.of(context).size.height / 3.5,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: color1.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Card(
                                elevation: 10.0,
                                margin: EdgeInsets.all(0.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Image.network(
                                  "https://cdn1.ntv.com.tr/gorsel/e8opKTVsvECYVY5-4m0s-g.jpg?width=700&height=875&mode=crop&scale=both&v=20190630072843775",
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            SizedBox(width: 20.0),
                            Expanded(
                              child: Column(
                                children: [
                                  _movieNameText(i, context),
                                  _yearText(i, context),
                                  _categoryText(i, context, color2),
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

  _ratesText(int i, BuildContext context) {
    return Text(
      popularmovies[i]['vote_average'].toString() + "/10",
      style:
          Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.white),
    );
  }

  _categoryText(int i, BuildContext context, Color color2) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0, bottom: 0.0),
        child: Text(
          category[i],
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
          popularmovies[i]['release_date'],
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
          popularmovies[i]['original_title'],
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
          child: Text(
            homePageTitles[2].toUpperCase(),
            style: TextStyle(
              color: Colors.white.withOpacity(0.5),
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
