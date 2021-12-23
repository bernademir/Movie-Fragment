import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';
import '../view/movieDetailView.dart';

class FloatAppBar extends StatelessWidget with PreferredSizeWidget {
  List mostRecentMovies;
  List popularMovies;
  List lastList = [];
  FloatAppBar(
    {
      Key? key,
      required this.mostRecentMovies,
      required this.popularMovies
    }
  ) : super(key: key);
  


  @override
  Widget build(BuildContext context) {
    String searchText = "Ara";
    return Stack(
      children: <Widget>[
        Positioned(
          top: 30,
          right: 0,
          left: 0,
          child: Row(
            children: <Widget>[
              IconButton(
                color: Colors.white,
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 5,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: TextField(
                    cursorColor: Colors.white,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.go,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 15),
                      hintText: searchText,
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              IconButton(
                color: Colors.white,
                icon: Icon(Icons.search),
                onPressed: () {
                  showSearch(context: context, delegate: Search(mostRecentMovies: mostRecentMovies, popularMovies: popularMovies));
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class Search extends SearchDelegate{
  List mostRecentMovies;
  List popularMovies;
  Search(
    {
      Key? key,
      required this.mostRecentMovies,
      required this.popularMovies
    }
  );

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: (){query: '';}, 
        icon: const Icon(Icons.clear)
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: (){
          close(context, null);
        }, 
        icon: const Icon(Icons.arrow_back)
      );
  }

  @override
  Widget buildResults(BuildContext context) {
    List matchQuery = [];
    List liste = [];
    for(var i=0; i<popularMovies.length; i++){
      if(popularMovies[i]['original_title'].toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(popularMovies[i]['original_title']);
        liste.add(popularMovies[i]);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index){
        print(matchQuery);
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
          onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MovieDetailView(
                              resultList: liste,
                              index: index,
                            ),
                          ),
                        );
                      }
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List matchQuery = [];
    List liste = [];
    for(var i=0; i<popularMovies.length; i++){
      if(popularMovies[i]['original_title'].toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(popularMovies[i]['original_title']);
        liste.add(popularMovies[i]);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index){
        print(matchQuery);
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
          onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MovieDetailView(
                              resultList: liste,
                              index: index,
                            ),
                          ),
                        );
                      }
        );
      },
    );
  }

}
