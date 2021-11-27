import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movie_fragment/ui/widget/ContainerGradient.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    Color containerColor = Color(0xff112d60);
    final double itemHeight = MediaQuery.of(context).size.height / 4;
    final double itemWidth = MediaQuery.of(context).size.width / 3;

    final favList = [
      //api den bu bilgiler cekilecek
      [
        "https://tr.web.img4.acsta.net/pictures/21/10/13/11/52/2707524.jpg",
        "movie name1",
        "8.0"
      ],
      [
        "https://tr.web.img4.acsta.net/pictures/21/10/13/11/52/2707524.jpg",
        "movie name2",
        "8.0"
      ],
      [
        "https://tr.web.img4.acsta.net/pictures/21/10/13/11/52/2707524.jpg",
        "movie name3",
        "8.0"
      ],
      [
        "https://tr.web.img4.acsta.net/pictures/21/10/13/11/52/2707524.jpg",
        "movie name4",
        "8.0"
      ],
      [
        "https://tr.web.img4.acsta.net/pictures/21/10/13/11/52/2707524.jpg",
        "movie name5",
        "8.0"
      ],
      [
        "https://tr.web.img4.acsta.net/pictures/21/10/13/11/52/2707524.jpg",
        "movie name6",
        "8.0"
      ],
    ];
    return ContainerGradient.bgGradient(
      Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 100.0),
                decoration: BoxDecoration(
                  color: containerColor.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    "Kullanıcı Adı: \nEmail: ",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0),
                decoration: BoxDecoration(
                  color: containerColor.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    "Puanlanan Fragmanlar",
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0),
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: itemWidth / itemHeight,
                  padding: const EdgeInsets.all(4.0),
                  mainAxisSpacing: 40.0,
                  crossAxisSpacing: 30.0,
                  children: [
                    ...favList.map(
                      (i) => Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            flex: 8,
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                width: itemWidth,
                                height: itemHeight,
                                child: Image.network(
                                  i.first,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: SizedBox(
                              width: 100.0,
                              child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  i.elementAt(1),
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .copyWith(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: SizedBox(
                              width: 50.0,
                              child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 15.0,
                                    ),
                                    Text(
                                      i.last,
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption!
                                          .copyWith(color: Colors.white),
                                    ),
                                  ],
                                ),
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
          ],
        ),
      ),
    );
  }
}
