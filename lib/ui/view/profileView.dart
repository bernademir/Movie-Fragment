import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../core/model/userModel.dart';
import '../widget/ContainerGradient.dart';
import 'loginView.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user?.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    Color color1 = Color(0xff112d60);
    Color color2 = Color(0xffB6C0C5);
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
        floatingActionButton: FloatingActionButton(
          backgroundColor: color1,
          child: Icon(
            Icons.logout_rounded,
            color: color2,
          ),
          onPressed: () {
            logOut(context);
          },
        ),
        body: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 100.0),
                decoration: BoxDecoration(
                  color: color1.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    "Kullanıcı Adı: ${loggedInUser.userName}\nEmail: ${loggedInUser.email}",
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
                margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
                decoration: BoxDecoration(
                  color: color1.withOpacity(0.7),
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
              flex: 5,
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

  Future<void> logOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => LoginView()));
  }
}
