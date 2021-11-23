import 'package:flutter/material.dart';
import 'package:movie_fragment/ui/widget/ContainerGradient.dart';
import 'package:movie_fragment/ui/widget/floatAppBar.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  _HomePageViewState createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  List homePageTitles = ["En Yeniler", "Popülerler", "İncele"];
  //populer kismi icin apiden gelecekler
  List movieNames = [
    "movie1",
    "movie2",
    "movie3",
    "movie4",
    "movie5",
    "movie6"
  ];
  List year = ["2020", "2020", "2020", "2020", "2020", "2020"];
  List category = [
    "category",
    "category",
    "category",
    "category",
    "category",
    "category"
  ];
  List rates = ["7.3", "5.5", "9.5", "8.5", "8.5", "8.5"];
  @override
  Widget build(BuildContext context) {
    Color containerColor = Color(0xff112d60);
    Color categoryNameColor = Color(0xffB6C0C5);
    return ContainerGradient.bgGradient(
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: FloatAppBar(),
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
                            color: containerColor.withOpacity(0.7),
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
                          color: containerColor.withOpacity(0.7),
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
                                  _categoryText(i, context, categoryNameColor),
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
      rates[i] + "/10",
      style:
          Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.white),
    );
  }

  _categoryText(int i, BuildContext context, Color categoryNameColor) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0, bottom: 0.0),
        child: Text(
          category[i],
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(color: categoryNameColor),
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
          year[i],
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
          movieNames[i],
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
