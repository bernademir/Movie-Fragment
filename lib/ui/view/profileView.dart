import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_fragment/core/service/movieService.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tmdb_api/tmdb_api.dart';

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

  
  List recommendedMovies = [];
  

  MovieService _service = MovieService();


  loadMovies() async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    int res = prefs.getInt("id")!;
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(_service.apiKey, _service.readAccesstoken));

    Map recommendedResult = await tmdbWithCustomLogs.v3.movies.getRecommended(res);
    setState(() {
      recommendedMovies = recommendedResult['results'];
      //fragments = fragmentsResult['results'];
    });
    print(recommendedMovies);
    print('bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb');
  }
  
  
  
  @override
  void initState() {
    loadMovies();
    super.initState();
    /*FirebaseFirestore.instance
        .collection("users")
        .doc(user?.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });*/
    
  }

  @override
  Widget build(BuildContext context) {
    Color color1 = Color(0xff112d60);
    Color color2 = Color(0xffB6C0C5);
    final double itemHeight = MediaQuery.of(context).size.height / 4;
    final double itemWidth = MediaQuery.of(context).size.width / 3;

    

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
              flex: 2,
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
            for (int i = 0; i < recommendedMovies.length; i++)
            Expanded(
              flex: 5,
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
                                      recommendedMovies[i]['poster_path']
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
                                    recommendedMovies[i]['original_title'],
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
                                        recommendedMovies[i]
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
    );
  }

  Future<void> logOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => LoginView()));
  }
}
